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
      title: '기차 예매',

      home: const HomePage(),
    );
  }
}