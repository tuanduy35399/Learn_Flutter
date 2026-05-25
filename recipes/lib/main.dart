import 'package:flutter/material.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', //tiêu đề này sẽ không hiển thị lên màn hình
      //Cái này chủ yếu để điện thoại nhận diện app thôi
      theme: ThemeData(

          primaryColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black)
      ),
      home: const MyHomePage(title: 'Test App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
// 1
    return Scaffold( //Scaffold cung cấp cấu trúc high level
      //Ta sẽ sử dụng 2 thuộc tính appBar và body
// 2
      appBar: AppBar(
        title: Text(widget.title),
      ),
// 3
      body: SafeArea(
// 4
        child: Container(),
      ),
    );
  }
}
