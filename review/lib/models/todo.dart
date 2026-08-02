import 'package:flutter/cupertino.dart';

class Todo {
  final String id; //Ma cong viec khong bao gio thay doi
  String? title;
  String? detail;
  bool isDone;
  // DateTime? createdAt;
  // DateTime? completedAt;
  Todo({
    required this.id,
    required this.title,
    required this.detail,
    this.isDone = false,
});
  static List<Todo> listTask() {
    return [
      Todo(id: '01', title: 'CheckMail', detail: 'Di kiem tra mail hom qua', isDone: true),
      Todo(id: '02', title: 'CheckMail', detail: 'Di kiem tra mail hom qua', isDone: true),
      Todo(id: '03', title: 'CheckMail3', detail: 'Kiem tra cuoc goi', ),
      Todo(id: '04', title: 'CheckMail4', detail: 'Kiem tra cuoc goi', ),
      Todo(id: '05', title: 'CheckMail6', detail: 'Kiem tra cuoc goi', ),
      Todo(id: '06', title: 'CheckMail', detail: 'Di kiem tra mail hom qua', ),
    ];
  }
}