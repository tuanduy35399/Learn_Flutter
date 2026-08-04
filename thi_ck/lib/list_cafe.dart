import 'package:flutter/material.dart';
import 'package:thi_ck/caffe.dart';

class ListCafe extends StatelessWidget {
  final Caffe ten;
  final VoidCallback onDelete;

  const ListCafe({super.key, required this.ten, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: BoxBorder.all(width: 2, color: Colors.black)
      // ),
      margin: EdgeInsets.only(top: 10),
      child: ListTile(
        leading: Icon(Icons.coffee),
        title: Text(ten.title ?? '', style: TextStyle(fontSize: 16)),
        onLongPress: onDelete,
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Đã đánh dấu đến thăm: ${ten.title}"))
          );
        },
      ),
    );
  }
}
