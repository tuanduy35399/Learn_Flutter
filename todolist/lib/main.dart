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
          body: Center(child: MyApp2(false))
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
class MyApp2 extends StatefulWidget {
  final bool isLoading;
  const MyApp2(this.isLoading); //khi có truyền tham số
  //hàm construct bắt buộc thêm required this. neu co truyen dich danh ten cua tham so
  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {

  late bool _localLoading; //đánh dấu late để tạm thời chưa gán giá trị
  @override
  void initState() {
    // super.initState();
    _localLoading = widget.isLoading;
  }
  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(_localLoading)
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child:Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
                  ),
                  color: Colors.blueAccent,
                  child: Padding(padding: EdgeInsetsGeometry.all(16),
                  child: Text("Loading..."),),
                )
              ),
            FloatingActionButton.extended(onPressed: onClick , label: Text("Push me")),
          ],
        ),
      );


  }

  void onClick() {
    setState(() {
      _localLoading = !_localLoading;
    });
  }
}


