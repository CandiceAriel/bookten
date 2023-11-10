import 'package:flutter/material.dart';
import 'package:mangakai/screen/home_page.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 154, 185, 243),
        ),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}