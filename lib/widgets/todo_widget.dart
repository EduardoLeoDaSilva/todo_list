import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo_item.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({Key? key, required this.todoItem}) : super(key: key);

  final TodoItem todoItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadiusDirectional.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}
