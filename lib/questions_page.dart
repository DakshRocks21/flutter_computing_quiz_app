import 'package:computing_quiz/main.dart';
import 'package:computing_quiz/questions_info.dart';
import 'package:computing_quiz/results.dart';
import 'package:flutter/material.dart';

class QuestionsPage extends StatelessWidget {
  late final int currentNo;
  late final QuestionInfo currentQuestion;

  QuestionsPage({super.key, required this.currentNo}) {
    currentQuestion = questions[currentNo];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: (currentNo + 1).toString(),
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' OF ${questions.length}'),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                currentQuestion.title,
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                currentQuestion.imagePath,
                height: 200,
                fit: BoxFit.cover,
              ),
              ListView.separated(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final option = currentQuestion.choices[index];
                  return GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: choiceColors[index],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Center(
                          child: Text(
                            option,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (currentQuestion.correctAns == index) {
                        currentQuestion.isCorrect = true;
                      }
                      if (questions.length == currentNo + 1) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => ResultsPage(),
                            ),
                            (route) => false);
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                QuestionsPage(currentNo: currentNo + 1),
                          ),
                        );
                      }
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: currentQuestion.choices.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
