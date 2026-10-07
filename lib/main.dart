import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HabitPanelScreen(),
    );
  }
}

class HabitPanelScreen extends StatefulWidget {
  @override
  _HabitPanelScreenState createState() => _HabitPanelScreenState();
}

class _HabitPanelScreenState extends State<HabitPanelScreen> {
  bool isDone1 = false;
  bool isDone2 = false;
  bool isDone3 = false;

  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name == "" ? "Мой день" : "Привет, " + name + "!"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: isDone1,
                    onChanged: (val) {
                      setState(() {
                        isDone1 = val!;
                      });
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Сделать зарядку", style: TextStyle(fontSize: 18)),
                      Text("07:00", style: TextStyle(color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: isDone2,
                    onChanged: (val) {
                      setState(() {
                        isDone2 = val!;
                      });
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Выпить воды", style: TextStyle(fontSize: 18)),
                      Text("08:00", style: TextStyle(color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: isDone3,
                    onChanged: (val) {
                      setState(() {
                        isDone3 = val!;
                      });
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Почитать книгу", style: TextStyle(fontSize: 18)),
                      Text("22:00", style: TextStyle(color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ),
            
            SizedBox(height: 30),

            // Этап 2: Форма
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: "Введите имя пользователя",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Поле не должно быть пустым";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          name = _textController.text;
                        });
                      }
                    },
                    child: Text("Проверить"),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
