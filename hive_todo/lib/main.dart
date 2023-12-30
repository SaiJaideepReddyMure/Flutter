import 'package:todo/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Buttonclass.dart';
import 'Todolist.dart';

void main() async {

await Hive.initFlutter();

var box = await Hive.openBox('Mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoPage(),
    );
  }
}

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  final _mybox = Hive.box('Mybox'); 
  ToDodatbase db = ToDodatbase();
  @override
  void initState()
  {
    super.initState();
    if(_mybox.get("TODOLIST") == null)
    {db.createIntialData();

    }
    else{
      db.loadData();
    }
  }
  final TextEditingController _taskcontroller = TextEditingController();
   

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todolistitems[index][1] = !db.todolistitems[index][1];
    });
  }

  void createnewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey,
          content: SizedBox(
            height: 120,
            child: Column(
              children: [
                TextField(
                  controller: _taskcontroller,
                  decoration:  const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 3, 2, 78),
                      ),
                    ),
                    hintText: "Add a task",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        onPressed: () {
                          String newtask = _taskcontroller.text;
                          if (newtask.isNotEmpty) {
                            setState(() {
                              db.todolistitems.add([newtask, false]);
                            });
                          }
                          Navigator.pop(context);
                          db.updatdata();
                        },
                        text: 'Save',
                      ),
                      MyButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: 'Cancel',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void deletetask(int index) {
    setState(() {
      db.todolistitems.removeAt(index);
    });
    db.updatdata();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const  Text("TO Do List"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 3, 2, 78),
        elevation: 0,
      ),
      body: db.todolistitems.isEmpty
          ?   Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                     const Text(
                      "No tasks to do",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    // You can add animations or icons here
                    // For example, you can use a Flutter package like flare_flutter for animations
                    // or show an icon indicating no tasks.
                    const Icon(Icons.sentiment_dissatisfied, size: 50),
                  ],
                ),
              
            ):ListView.builder(
        itemCount: db.todolistitems.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskname: db.todolistitems[index][0],
            onChanged: (value) => checkBoxChanged(value, index),
            taskcompleted: db.todolistitems[index][1],
            deletefunction: (context) => deletetask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:const Color.fromARGB(255, 3, 2, 78),
        onPressed: createnewtask,
        child:  const Icon(Icons.add),
      ),
    );
  }
}



