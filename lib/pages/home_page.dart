import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15)),
                    child: const Icon(Icons.add),
                  )
                ],
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Container(
                    color: Colors.black,
                    height: 60,
                  ),
                  Container(
                    color: Colors.blue,
                    height: 60,
                  ),
                  Container(
                    color: Colors.blue,
                    height: 60,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text('There are 4 todo items in the todo list'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Clear list'),
                      style:
                          ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
