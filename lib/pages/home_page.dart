import 'package:flutter/material.dart';
import 'package:todo_list/models/todo_item.dart';
import 'package:todo_list/repositories/todo_repository.dart';
import 'package:todo_list/widgets/todo_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TodoItem> todoList = [];

  final TextEditingController todoInputController = TextEditingController();


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TodoRepository().getListTodoItem().then((value) {
      if(value != null) {
        todoList.addAll(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoInputController,
                        decoration: InputDecoration(
                          label: const Text('Todo item'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () async {
                        var todoItem = TodoItem(
                            title: todoInputController.text,
                            date: DateTime.now());
                        setState(() {
                          todoList.add(todoItem);
                        });
                        await TodoRepository().saveTodoItem(todoList);
                        todoInputController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15)),
                      child: const Icon(Icons.add),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      for (var item in todoList)
                        TodoItemWidget(
                            todoItem: item, deleteFunction: delete_todoItem),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                            'There are ${todoList.length} todo items in the todo list'),
                      ),
                      ElevatedButton(
                        onPressed: () => clearList(),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15)),
                        child: const Text('Clear list'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clearList() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Clear list'),
            content: const Text('Are you sure?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      todoList.clear();
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Clear')),
            ],
          );
        });
  }

  void delete_todoItem(TodoItem todoItem) {
    int indexItem = todoList.indexOf(todoItem);
    setState(() {
      todoList.remove(todoItem);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        action: SnackBarAction(
          label: 'Defazer',
          onPressed: () {
            setState(() {
            todoList.insert(indexItem, todoItem);
            });
          },
          textColor: Colors.white,
        ),
        content: const Text(
          'Item deleted with success!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
