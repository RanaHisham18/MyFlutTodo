import 'package:flutter/material.dart';
import 'package:my_flut_todo/database_helper.dart';



class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => ToDoListState();
}

class ToDoListState extends State<ToDoList> {
  TextEditingController newSentenceController = TextEditingController();
  List<Map<String, dynamic>> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    var dbTasks = await DatabaseHelper.instance.getTodoItems();
    setState(() {
      tasks = dbTasks;
    });
  }

  Future<void> _addTask(String sentence) async {
    await DatabaseHelper.instance.addTodoItem(sentence);
    await _loadTasks();
  }

  Future<void> _toggleTaskStatus(int id, bool isCompleted) async {
    await DatabaseHelper.instance.updateTaskStatus(id, isCompleted);
    await _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff0140a28),
        leading: const Icon(Icons.menu),
        title: const Text("To Do List"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 325,
              child: TextFormField(
                controller: newSentenceController,
                decoration: const InputDecoration(
                  labelText: "New Task",
                  labelStyle: TextStyle(color: Color(0xff321a70)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff321a70)),
                  ),
                  prefixIcon: Icon(Icons.edit),
                  prefixIconColor: Color(0xff321a70),
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () async {
                if (newSentenceController.text.isNotEmpty) {
                  await _addTask(newSentenceController.text);
                  newSentenceController.clear();
                }
              },
              color: const Color(0xff321a70),
              textColor: Colors.white,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  bool isCompleted = tasks[index]['isCompleted'] == 1;
                  return ListTile(
                    leading: Checkbox(
                      value: isCompleted,
                      onChanged: (bool? value) {
                        if (value != null) {
                          _toggleTaskStatus(tasks[index]['id'], value);
                        }
                      },
                    ),
                    title: Text(
                      tasks[index]['sentence'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isCompleted ? Colors.grey : const Color(0xff321a70),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
