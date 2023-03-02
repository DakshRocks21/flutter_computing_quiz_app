import 'package:computing_quiz/questions_info.dart';
import 'package:computing_quiz/questions_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


final questions = [
  QuestionInfo(
      title: "Is RAM volatile or non-volatile?",
      imagePath: "assets/q1.jpg",
      choices: ["Volatile", "Non-volatile"],
      correctAns: 0),
  QuestionInfo(
      title: "Calculate the number of bits (not bytes) in 8 TB.",
      imagePath: "assets/q2.jpg",
      choices: [
        "8 000 000 000 000",
        "8 000 000 000",
        "64 000 000 000 000",
        "64 000 000 000"
      ],
      correctAns: 2),
  QuestionInfo(
      title: "Select the storage media that has the highest storage capacity.",
      imagePath: "assets/q3.jpeg",
      choices: ["Magnetic hard disk", "Solid-state drive", "Optical disc"],
      correctAns: 0)
];
const choiceColors = [
  Color(0xFFE35B5B),
  Color(0xFF51C84E),
  Color(0xFFDFCC23),
  Color(0xFF55CBF0)
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuestionsPage(currentNo:0),
    );
  }
}
