import 'package:flutter/material.dart';

import '../models/todo.dart';


class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detaiController = TextEditingController();

  void _saveTodo(){
    final title= _titleController.text.trim();
    final detail= _detaiController.text.trim();

    if(title.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui long nhap tieu de"))
      );
      return;
    }

    final newTodo= Todo(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title,
      detail: detail,
    );
    Navigator.pop(context, newTodo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new task"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
         child: Column(
           children: [
             TextField(
               controller: _titleController,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: "Nhap ten cong viec",
               ),
             ),
             SizedBox(height: 10,),
             TextField(
               controller: _detaiController,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: "Nhap mo ta chi tiet",
               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text("Luu cong viec"),
                 IconButton(onPressed: _saveTodo, icon: Icon(Icons.save)),
               ],
             )
           ],
         ),
      ),
    );
  }
}
