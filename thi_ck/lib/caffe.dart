class Caffe {
  final String id;
  String? title;

  Caffe({
    required this.id,
    required this.title,
});
  static List<Caffe> dsCafe(){
    return [
      Caffe(id: '01', title: "Cafe Laura"),
      Caffe(id: '02', title: "Cafe Tran Quang"),
      Caffe(id: '03', title: "Cafe Cuc Chon"),
    ];
  }
}