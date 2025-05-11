import 'package:flutter/material.dart';
import 'package:mingguan/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDolist = [];


  void checkBoxChanged(int index) {
    setState(() {
      toDolist[index][1] = !toDolist[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      toDolist.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDolist.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
         title: const Text("Daftar Tugas"),
         centerTitle: true,
         backgroundColor: Colors.deepPurple,
         foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDolist.length,
        itemBuilder: (BuildContext context, int index) {
          return Todolist(
            tasName: toDolist[index][0],
            taskCompleted: toDolist[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction: (contex) => deleteTask(index),
          );
        },
      ),
    );
  }
}