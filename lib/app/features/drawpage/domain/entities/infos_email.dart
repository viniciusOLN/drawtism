class InfosEmail {
  int attempts;
  String username;
  Map<int, dynamic> listAttempts;
  Map<int, dynamic> timeDurations;

  InfosEmail({
    required this.username,
    required this.attempts,
    required this.listAttempts,
    required this.timeDurations,
  });
}
