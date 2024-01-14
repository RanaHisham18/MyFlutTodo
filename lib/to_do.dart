import 'package:flutter/material.dart';

class to_do_list extends StatefulWidget {
  const to_do_list({Key? key}) : super(key: key);

  @override
  State<to_do_list> createState() => to_do_state();
}

class to_do_state extends State<to_do_list> {
  TextEditingController newSentence = TextEditingController();
  List<String> sentences = [];
  List<bool> checkboxValues = [];
  List<Color> textColors = [];

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
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 325,
              child: TextFormField(
                controller: newSentence,
                decoration: const InputDecoration(
                  labelText: "New Sentence",
                  labelStyle: TextStyle(color: Color(0xff321a70)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff321a70))),
                  prefixIcon: Icon(Icons.edit),
                  prefixIconColor: Color(0xff321a70),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  sentences.add(newSentence.text);
                  checkboxValues.add(false);
                  textColors.add(const Color(0xff321a70));
                  newSentence.clear();
                });
              },
              color: const Color(0xff321a70),
              textColor: Colors.white,
              child: const Text('Submit'),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: sentences.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: checkboxValues[index],
                        onChanged: (value) {
                          setState(() {
                            checkboxValues[index] = value!;
                            if (value) {
                              textColors[index] = Colors.grey;
                            } else {
                              textColors[index] = Color(0xff321a70);
                            }
                          });
                        },
                        activeColor: const Color(0xff321a70),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        sentences[index],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: textColors[index]),
                      )
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}