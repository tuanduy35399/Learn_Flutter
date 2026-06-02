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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const ScreenTwo(),
    );
  }
}

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  List<String> names = [];

  @override
  void initState() {
    names = [
      'Tran Quoc Tuan Duy',
      'Nguyen Van A',
      'Nguyen Van B',
      'Nguyen Thi C',
      'Tran Van D',
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Thực thi code sau khi render view xong
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: BackButton(),
          title: Text(
            "Screen2 title",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            // Icon(Icons.account_circle, size: 40,),
            // Text("Tran Quoc Tuan Duy"),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.edit),
            // ),
            ListView.separated(itemBuilder: (context, index) {
              return Text(names[index]);
            }, separatorBuilder: (context, index){
              return Divider();
            }, itemCount: names.length)
          ],
        ),
      ),
    );
  }
}