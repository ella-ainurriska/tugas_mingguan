import 'package:flutter/material.dart';

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
    );
  }
}