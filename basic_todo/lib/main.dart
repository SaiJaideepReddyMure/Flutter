// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoItem> todoItems = [
    TodoItem(taskName: "Need to work", taskCompleted: true),
    TodoItem(taskName: "Need to visit temple", taskCompleted: false),
  ];

  void _addTask(String taskName) {
    setState(() {
      todoItems.add(TodoItem(taskName: taskName, taskCompleted: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text("Your To-Do List"),
        backgroundColor: const Color.fromRGBO(18, 2, 197, 0.2),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top:10.0,left:8.0,right: 8.0),
            child: ToDoList(
              task: todoItems[index],
              onChanged: (bool? newValue) {
                setState(() {
                  todoItems[index].taskCompleted = newValue ?? false;
                });
              },
              onDelete: () {
                setState(() {
                  todoItems.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddTaskDialog(BuildContext context) async {
    String newTaskName = "";

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add New Task"),
          content: TextField(
            onChanged: (value) {
              newTaskName = value;
            },
            decoration: const InputDecoration(
              hintText: "Enter task name",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _addTask(newTaskName);
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }
}

class ToDoList extends StatefulWidget {
  final TodoItem task;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onDelete;

  const ToDoList({
    Key? key,
    required this.task,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.task.taskCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.task.hashCode.toString()),
      onDismissed: (direction) {
        widget.onDelete();
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isChecked ? Colors.green : Colors.yellowAccent,
        ),
        child: ListTile(
          title: Text(widget.task.taskName),
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
            widget.onChanged(isChecked);
          },
          trailing: Checkbox(
            value: isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                isChecked = newValue ?? false;
              });
              widget.onChanged(isChecked);
            },
          ),
        ),
      ),
    );
  }
}

class TodoItem {
  String taskName;
  bool taskCompleted;

  TodoItem({
    required this.taskName,
    required this.taskCompleted,
  });
}
