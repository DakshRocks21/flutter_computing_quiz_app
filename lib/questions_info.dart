class QuestionInfo {
  final String title;
  final String imagePath;
  final List<String> choices;
  final int correctAns;
  var isCorrect = false;

  QuestionInfo(
      {required this.title,
      required this.imagePath,
      required this.choices,
      required this.correctAns});
}