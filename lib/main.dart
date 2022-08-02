import 'package:flutter/material.dart';
import 'package:quizzer_modelizing/feature/home/home.dart';
import 'feature/page_animated/page_view.dart';
import 'feature/page_vertical_page/page_vertical.dart';
import 'feature/sms/view.dart';
import 'feature/web_scrapping_page/web_scrapping.dart';
import 'features/home_quizz/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizzer Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  SmsVeiwUser(),
    );
  }
}
