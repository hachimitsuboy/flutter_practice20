import 'package:flutter/material.dart';
import 'package:flutter_method_channel_practice/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MethodChannel_practice",
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
