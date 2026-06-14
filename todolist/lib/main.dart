import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,

          title: Text("Todolist"),
          leading: Icon(Icons.menu),
        ),
          body: Center(child: MyApp(true))
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  final bool loading;
  const MyApp(this.loading);

  @override
  Widget build(BuildContext context) {
    return loading? CircularProgressIndicator() : const Text("State");
  }
}

