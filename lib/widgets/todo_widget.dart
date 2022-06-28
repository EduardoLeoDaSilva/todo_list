import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo_item.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({Key? key, required this.todoItem, required this.deleteFunction}) : super(key: key);

  final TodoItem todoItem;
  final Function(TodoItem) deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Slidable(
          endActionPane: ActionPane(
            motion: const BehindMotion(),

            children: [
              SlidableAction(onPressed:(context){
                deleteFunction(todoItem);
              }, 
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Delete',)
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadiusDirectional.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(DateFormat('dd/MM/yyyy EEE').format(todoItem.date!)),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  todoItem.title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
