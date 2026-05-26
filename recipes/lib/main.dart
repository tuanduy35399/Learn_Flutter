import 'package:flutter/material.dart';
import 'recipe.dart';
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
      //nó chuẩn bị sẵn các vị trí tiêu đề, vùng nd ở giữa, thanh menu phía dưới
      //Ta sẽ sử dụng 2 thuộc tính appBar và body
// 2
      appBar: AppBar(
        title: Text(widget.title),
      ),
// 3
      body: SafeArea( //thông minh giúp nd không bị che bởi mấy
        //phần cứng như tai thỏ, nốt ruồi, thanh điều hướng vuốt ngang
// 4
        child: ListView.builder(
            itemCount: Recipe.dsThucDon.length, //xác định số lượng hàm để hiển thị
            itemBuilder: (BuildContext context, int index) {
              return Text(Recipe.dsThucDon[index].label);
            }
        )
        // Container(), //Container như 1 hộp chứa vạn năng
        //Nơi ta có thể thêm màu sắc, kích thước, hoặc các widget con
      ),
    );
  }
}

/*
*Nên tìm hiểu về WidgetTree
* MaterialApp -> MyHomePage -> Scaffold -> SafeArea -> Container
* */
