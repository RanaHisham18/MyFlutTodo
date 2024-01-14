import 'package:flutter/material.dart';

class To_Do_List extends StatelessWidget {
  const To_Do_List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.menu),
        title: const Text("To Do List"),
        actions: [
          IconButton(
            onPressed: () {
              print("Hello world");
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}