import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ScreenTwo(),
    );
  }
}



// class TestScreen1 extends StatelessWidget {
//   const TestScreen1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Text('Xin chào con mẹ mày'),);
//   }
// }

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  String str= "";

  @override
  void initState() {
    // TODO: implement initState
    str = "init done";
    WidgetsBinding.instance.addPostFrameCallback((_){
      //Thực thi code sau khi render view xong
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: BackButton(), //view trước khi title hiển thị
        title: Text("Screen2 title", style: TextStyle(color: Colors.white),
      )),
      body: Center(
      child: Column(children: [
        SizedBox(height: 300,),
        Text("Respone: $str"),
        OutlinedButton(onPressed: (){
          setState(() {
            str = "New str";
          });
        }, child: Text('Click')),
        TextButton(onPressed: (){
          log('Log text button');
        }, child: Text("Text button")),
        FilledButton(onPressed: (){
          log('log filled button');
        }, child: Text("Filled button"))
      ],),
    ),));
  }
}
