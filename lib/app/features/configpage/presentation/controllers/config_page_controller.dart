import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigPageController extends GetxController {
  bool isPlaying = false;
  String titleButton = "";

  @override
  void onInit() async {
    super.onInit();
    isPlaying = await getAudio();
    setButtonTitle();
  }

  void setButtonTitle() {
    titleButton = !isPlaying ? "Pausar Música" : "Tocar Música";
  }

  void setAudio(bool state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("music", state);
  }

  Future<bool> getAudio() async {
    final prefs = await SharedPreferences.getInstance();
    bool isPlaying = prefs.getBool("music") ?? false;
    return isPlaying;
  }
}
