import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigPageController extends GetxController {
  bool isPlaying = false;
  String titleButton = "Pausar Música";

  void setAudio(bool) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("music", bool);
  }

  Future<bool> getAudio() async {
    final prefs = await SharedPreferences.getInstance();
    bool isPlaying = prefs.getBool("music") ?? false;
    return isPlaying;
  }
}
