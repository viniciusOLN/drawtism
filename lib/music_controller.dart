import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class MusicController extends GetxController {
  AudioPlayer playerThemeSong = AudioPlayer();

  void playThemeSong() {
    playerThemeSong.play(
      AssetSource('music/theme_music.mp3'),
    );
    playerThemeSong.onPlayerComplete.listen((event) {
      playerThemeSong.play(
        AssetSource('music/theme_music.mp3'),
      );
    });
  }
}
