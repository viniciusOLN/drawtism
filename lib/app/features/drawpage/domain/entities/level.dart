class Level {
  String identifyTask;
  String urlImage;
  String title;
  DateTime? initialDateDoneTask;
  DateTime? finalDateDoneTask;
  int? attempts = 0;

  Level({
    required this.identifyTask,
    required this.urlImage,
    required this.title,
    this.attempts,
  });
}
