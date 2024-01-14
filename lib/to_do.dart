import 'dart:ui';

import 'package:flutter/material.dart';

class To_Do_List extends StatelessWidget {
  const To_Do_List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff0140a28),
        leading: const Icon(Icons.menu),
        title: const Text("To Do List"),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 50,
            icon: const CircleAvatar(
              backgroundColor: Color(0xff321a70),
              radius: 50,
              child: Icon(Icons.add, size: 30, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                color: Colors.grey[300],
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Search",
                        style: TextStyle(
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      print("Finished");
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Finish my English Homework",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      print("Finished");
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Finish my English Homework",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      print("Finished");
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Finish my English Homework",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      print("Finished");
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Finish my English Homework",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    activeColor: const Color(0xff321a70),
                    onChanged: (value) {
                      print("Finished");
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Finish my English Homework",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0xff321a70),
                    value: true,
                    onChanged: (value) {
                      print("Finished");
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Finish my English Homework",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0xff321a70),
                    value: true,
                    onChanged: (value) {
                      print("Finished");
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Finish my English Homework",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0xff321a70),
                    value: true,
                    onChanged: (value) {
                      print("Finished");
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Finish my English Homework",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}