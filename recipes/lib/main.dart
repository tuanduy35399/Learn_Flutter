import 'package:flutter/material.dart';

void main() { //hàm khởi chạy. Mọi ứng dụng đều bắt đầu từ hàm này
  runApp(const RecipeApp()); //có nhiệm vụ lấy widget mà ta truyền vào rồi gắn nó vô
  //màn hình làm widget gốc
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //cấu hình cho app tuân theo Material Design
      title: 'Flutter Demo', //tiêu đề này sẽ không hiển thị lên màn hình
      //Cái này chủ yếu để điện thoại nhận diện app thôi
      theme: ThemeData( //định nghĩa màu sắc chủ đạo của app
          primaryColor: Colors.white, //màu chính
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black) //màu phụ
      ),
      home: const MyHomePage(title: 'Test App'), //màn hình đầu tiên xuất hiện khi mở app
      //nó gọi đến hàm MyHomePage và truyền tiêu đề TestApp
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
