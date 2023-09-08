import 'package:get/get.dart';

class DrawingPageController extends GetxController {
  int currentDraw = 0;
  int limitPerLevel = 2;

  void nextDraw() {
    if (currentDraw == limitPerLevel) {
      return;
    }
    currentDraw++;
    update(['board']);
  }
}
