import 'package:flutter/material.dart';
import 'package:thi_ck/caffe.dart';

import 'list_cafe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quan cafe yeu thich',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Quán cafe yêu thích'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String keyWord= "";
  final TextEditingController _nameController= TextEditingController();
  final List<Caffe> _ds= Caffe.dsCafe();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  void _saveCoffe() {
    final name= _nameController.text.trim();
    if(name.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui lòng nhập thông tin quán nhé =))"))
      );
      return;
    }
    setState(() {
      _ds.add(Caffe(id: DateTime.now().microsecondsSinceEpoch.toString(), title: name));
    });
    _nameController.clear();
  }
  //Ham xoa
  void _deleteCoffee(Caffe ten) {
    setState(() {
      _ds.remove(ten);
    });
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
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        // color: Colors.red,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Row(children: [
                Expanded(
                  child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Nhập tên quán cafe",
                    border: OutlineInputBorder(),
                  ),),
                ),
                ElevatedButton(onPressed: _saveCoffe, child: Text("LƯU"))
              ],),
            Expanded(child: ListView.builder(
              itemCount: _ds.length,
              itemBuilder: (context,index){
                final cafe = _ds[index];
                return ListCafe(
                    ten: cafe,
                    onDelete: () {
                      _deleteCoffee(cafe);
                    },);
              }

            ))
          ],
        ),
      ),

    );
  }
}
