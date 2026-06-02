import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail.dart';
import 'package:device_preview/device_preview.dart';
void main() {
  runApp( DevicePreview(
    enabled: !kReleaseMode, // Chỉ bật khi chạy debug, tắt khi build release
    builder: (context) => const RecipesApp(), // App của bạn
  )
  );
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  // This widget is the root of your application.
  @override //ghi đè hàm build có sẵn trong StatelessWidget
  Widget build(BuildContext context) {
    //Tạo 1 đối tượng them cho ThemeData
    final ThemeData theme = ThemeData();
    //ThemeData will show the standard Material defaults
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: theme.copyWith(
        //định nghĩa giao diện mặc định cho toàn bộ app
        /*
         MaterialApp
          │
          ├── ThemeData
          │
          ├── Home Screen
          │
          ├── Routes
          │
          └── Navigator
        * */
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
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
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.green),
      body: SafeArea(
        // 4
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              // 8
              onTap: () {
                // 9
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // 10
                      return RecipeDetail(recipe: Recipe.samples[index]);
                    },
                  ),
                );
              },
              // 11
              child: buildRecipeCard(Recipe.samples[index]),
            );
          },
          itemCount: Recipe.samples.length,
        ),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      color: Colors.red,
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(recipe.imageUrl)),
            //Chèn thêm 1 SizedBox
            const SizedBox(height: 14.0),
            Text(
              recipe.label,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
