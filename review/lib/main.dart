import 'package:flutter/material.dart';
import 'package:review/constraints/colors.dart';
import 'package:review/models/todo.dart';
import 'package:review/pages/first_page.dart';
import 'package:review/pages/second_page.dart';
import 'package:review/widget/todo_items.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> _todos= Todo.listTask(); //Ds đặt trong state


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBGColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Icon(
              Icons.menu, 
              color: tdBlack, 
              size: 30),
            SizedBox(
              height: 30,
              width: 30,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset("assets/images/images.png"),
                  )
            )
          ],
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        height: 10000,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start, //tránh bị canh giữa nội dung
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text("Search"),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),

            Expanded(child: ListView(
              children: [
                SizedBox(height: 20), Text(
                    "All Todos",
                    style: TextStyle(fontSize: 30, color: tdBlack,)
                ),
                for( Todo e in _todos)
              TodoItems(todo: e, onChanged: (value){
                setState(() {
                  e.isDone = value ?? false;
                });
              },)]))
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increase',
        child: const Icon(Icons.add),
      ),
    );
  }
}

//Ex 1: List, Page cơ bản
// body: Container(
//   height: 800,
//   padding: EdgeInsets.only(left: 10, right: 10),
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Container(
//         height: 200,
//         // width: 200,
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadiusGeometry.circular(10),
//           border: BoxBorder.all(width: 2, color: Colors.black),
//           color: Colors.lightBlue,
//         ),
//         child: ListView(
//             children: [
//               Text("data 1"),
//               Text("data 2"),
//               Text("data 3"),
//               Text("data 4"),
//             ],
//         ),
//       ),
//       SizedBox(height: 10,),
//       Container(
//         height: 200,
//         // width: 200,
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadiusGeometry.circular(10),
//           border: BoxBorder.all(width: 2, color: Colors.black),
//           color: Colors.lightBlue,
//         ),
//         child: PageView(
//           children: [
//             Text("Page 1"),
//             Text("Page 2"),
//             Text("Page 3"),
//             Text("Page 4"),
//           ],
//         ),
//       ),
//
//     ],
//   )
// ),

//Ex 2: Input, nút cơ bản
// body: Container(
//   padding: EdgeInsets.all(10),
//   child: Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         TextField(
//           decoration: InputDecoration(
//             label: Text("Nhap vao ten"),
//             border: OutlineInputBorder(),
//           ),
//         ),
//         SizedBox(height: 10),
//         InputDatePickerFormField(
//           firstDate: DateTime(2024),
//           lastDate: DateTime(2026),
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text("La sinh vien?"),
//             Switch(
//               value: value,
//               onChanged: (newValue) {
//                 setState(() {
//                   value = newValue;
//                 });
//               },
//             ),
//           ],
//         ),
//         ElevatedButton(
//           onPressed: () {},
//           child: const Text("SAVE"),
//
//         ),
//       ],
//     ),
//   ),
// ),
// body: Container(
//   child: Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         TextButton(onPressed: (){
//           Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyFirstPage(),));
//         }, child: const Text("First Page")),
//         TextButton(onPressed: (){
//           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MySecondPage()));
//         }, child: const Text("Second Page")),
//       ],
//     ),
//   ),
// ),
