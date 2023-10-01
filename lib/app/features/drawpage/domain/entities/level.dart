class Level {
  String identifyTask;
  String urlImage;
  String title;
  String? initialTime;
  String? finalTime;
  int? attempts = 0;

  Level({
    required this.identifyTask,
    required this.urlImage,
    required this.title,
    this.attempts = 0,
    this.initialTime,
    this.finalTime,
  });
}
