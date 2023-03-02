import 'package:computing_quiz/main.dart';
import 'package:computing_quiz/questions_page.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  late final double percentScore;
  late final String remark;

  ResultsPage({super.key}) {
    percentScore = questions.where((element) => element.isCorrect).length /
        questions.length *
        100;
    if (percentScore >= 80) {
      remark = "Well done, keep up the good work!";
    } else if (percentScore >= 60) {
      remark = "Good job, try harder next time!";
    } else {
      remark = "Try harder next time!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${percentScore.toStringAsFixed(2).toString()}%",
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: percentScore >= 50
                      ? const Color.fromARGB(240, 35, 150, 45)
                      : const Color.fromARGB(255, 162, 52, 52),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                remark,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: percentScore >= 50
                      ? const Color.fromARGB(240, 35, 150, 45)
                      : const Color.fromARGB(255, 162, 52, 52),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              IconButton(
                onPressed: () {
                  for (var i = 0; i < questions.length; i++) {
                    questions[i].isCorrect = false;
                  }
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => QuestionsPage(currentNo: 0),
                      ),
                      (route) => false);
                },
                icon: const Icon(Icons.restart_alt_outlined),
                iconSize: 120,
              )
            ],
          ),
        ),
      ),
    );
  }
}
