import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/homepage.dart';


void main() {
  runApp(const TrainApp());
}

class TrainApp extends StatelessWidget {
  const TrainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false, // 디버그 배너 제거
    );
  } 
}