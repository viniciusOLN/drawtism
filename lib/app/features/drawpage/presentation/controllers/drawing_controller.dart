import 'package:drawtism/app/features/resultpage/presentation/domain/entities/result_entity.dart';
import 'package:drawtism/app/features/resultpage/presentation/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawingPageController extends GetxController {
  int currentDraw = 0;
  int currentLevel = 0;
  int attempts = 0;
  int countUsedColors = 0;
  int limitPerLevel = 2;
  List listUsedColors = [];

  void nextDraw(BuildContext context) {
    if (currentDraw == limitPerLevel) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            result: InfosResult(
              attempts: attempts,
              usedColors: countUsedColors,
              nextLevel: currentLevel + 1,
            ),
          ),
        ),
      );
      return;
    }
    currentDraw++;
    update(['board']);
  }
}
