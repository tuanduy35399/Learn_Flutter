import 'package:flutter/material.dart';
import 'package:review/constraints/colors.dart';
import 'package:review/models/todo.dart';
import '../models/todo.dart';

class TodoItems extends StatelessWidget {
  final Todo todo; //day la bien cua class TodoItems
  final ValueChanged<bool?> onChanged;
  // //ham constructor yc phai kem tham so todo
  // final VoidCallback onToggle; //VoidCallback là gì?
  // final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TodoItems({
    super.key,
    required this.todo,
    required this.onChanged,
    // required this.onToggle,
    // required this.onEdit,
    required this.onDelete,
  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(width: 0.6),
        ),
        leading: Checkbox(value: todo.isDone, onChanged: onChanged),
        title: Text(
          todo.title ?? '',
          style: TextStyle(fontSize: 16, color: tdBlack, decoration: todo.isDone ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        subtitle: Text(
          todo.detail ?? '',
          style: TextStyle(fontSize: 10, color: tdBlack),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: Colors.lightBlue,)),
            IconButton(onPressed: onDelete, icon: Icon(Icons.delete, color: Colors.red,))
          ],
        ),
      ),
    );
  }
}
