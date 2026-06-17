import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'Site.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            title: Text("Lich cup dien Can Tho"),
            centerTitle: true,
          ),
          body: const MyApp4(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}



class MyApp4 extends StatelessWidget {
  const MyApp4({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blueAccent, width: 2),
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      margin: EdgeInsets.only(left:35 ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'Tuan Duy la tao ne',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}

class CrawlData extends StatefulWidget {
  const CrawlData({super.key});

  @override
  State<CrawlData> createState() => _CrawlDataState();
}

class _CrawlDataState extends State<CrawlData> {
  List<Site> data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWebsiteData(); //goi ham
  }

  Future<void> getWebsiteData() async {
    final url = Uri.parse("https://lichcupdien.org/lich-cup-dien-can-tho");
    final res = await http.get(url);

    if (res.statusCode == 200) {
      dom.Document html = dom.Document.html(res.body);

      // 1. Tìm tất cả các khối bao quanh mỗi lịch cúp điện
      final detailWrappers = html.querySelectorAll('.lcd_detail_wrapper');

      List<Site> tempEntries = [];

      for (final wrapper in detailWrappers) {
        // Tìm tất cả các hàng thông tin bên trong khối này
        final rows = wrapper.querySelectorAll('.new_lcd_wrapper');

        // Tạo các biến tạm để lưu thông tin của khối hiện tại
        String dienLuc = "";
        String ngay = "";
        String thoiGian = "";
        String khuVuc = "";
        String lyDo = "";
        String trangThai = "";
        for (final row in rows) {
          // Lấy tiêu đề (Ví dụ: "Điện lực:", "Ngày:", "Thời gian:")
          final titleElement = row.querySelector('.title_item_lcd_wrapper');
          // Lấy nội dung tương ứng
          final contentElement = row.querySelector('.item_content_lcd_wrapper');

          if (titleElement != null && contentElement != null) {
            String title = titleElement.text.trim();
            String content = contentElement.text.trim();

            // Dựa vào tiêu đề để gán vào biến chính xác
            if (title.contains("Điện lực")) {
              dienLuc = content;
            } else if (title.contains("Ngày")) {
              ngay = content;
            } else if (title.contains("Thời gian")) {
              thoiGian = content;
            } else if (title.contains("Khu vực")) {
              khuVuc = content;
            } else if (title.contains("Lý do")) {
              lyDo = content;
            } else if (title.contains("Trạng thái")) {
              trangThai = content;
            }
          }
        }

        // 2. Khởi tạo Object Site của bạn (Bỏ comment nếu cấu trúc Site của bạn giống như thế này)
        Site item = Site(
          dienluc: dienLuc,
          ngay: ngay,
          thoigian: thoiGian,
          khuvuc: khuVuc,
          lydo: lyDo,
          trangthai: trangThai,
        );
        tempEntries.add(item);
      }

      // Cập nhật lại UI sau khi đã crawl xong dữ liệu
      setState(() {
        data = tempEntries;
      });
    } else {
      print("Lỗi tải trang: ${res.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Nếu dữ liệu đang trống, hiển thị vòng tròn xoay loading
    if (data.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Nếu đã có dữ liệu, hiển thị danh sách Card
    return ListView.builder(
      itemCount: data.length, // Số lượng phần tử trong danh sách
      itemBuilder: (context, index) {
        // Lấy ra phần tử thứ index trong mảng dữ liệu
        final currentSite = data[index];

        // Trả về widget CardItem đã định nghĩa ở trên
        return CardItem(site: currentSite);
      },
    );
  }
}

class CardItem extends StatelessWidget {
  final Site site;

  const CardItem({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.greenAccent, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              site.dienluc, // Tên điện lực (ví dụ: Điện lực Quận Ô Môn)
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Ngày: ${site.ngay}",
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 4),
            Text("Thời gian: ${site.thoigian}"),
            const SizedBox(height: 4),
            Text(
              "Khu vực: ${site.khuvuc}",
              style: const TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 4),
            Text(
              "Lý do: ${site.lydo}",
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp3 extends StatefulWidget {
  const MyApp3({super.key});

  @override
  State<MyApp3> createState() => _MyApp3State();
}

class _MyApp3State extends State<MyApp3> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: const Text(
            "Day la text de hoc buoi thu 4 "
            "trong chuoi video YT, hom nay troi rat "
            "Dep luon day quy vi oi",
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.visible,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
          side: BorderSide(
            color: Colors.greenAccent,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
      ),

      // height: 100,
    );
  }
}

class MyApp extends StatelessWidget {
  final bool loading;

  const MyApp(this.loading);

  @override
  Widget build(BuildContext context) {
    return loading ? CircularProgressIndicator() : const Text("State");
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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_localLoading)
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
                ),
                color: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsetsGeometry.all(16),
                  child: Text("Loading..."),
                ),
              ),
            ),
          FloatingActionButton.extended(
            onPressed: onClick,
            label: Text("Push me"),
          ),
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
