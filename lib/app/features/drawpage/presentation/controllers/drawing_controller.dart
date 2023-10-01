import 'package:drawtism/app/features/drawpage/domain/entities/level.dart';
import 'package:drawtism/app/features/resultpage/presentation/domain/entities/result_entity.dart';
import 'package:drawtism/app/features/resultpage/presentation/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver_v3/image_gallery_saver.dart';

class DrawingPageController extends GetxController {
  int currentDraw = 0;
  int currentLevel = 0;
  int attempts = 0;
  int countUsedColors = 0;
  int limitPerLevel = 2;
  List listUsedColors = [];
  late GlobalKey keyToImage;
  String currentTextColor = "Escolha uma cor!";
  Color currentColor = Color.fromRGBO(54, 60, 204, 1);

  void nextDraw(BuildContext context) async {
    await save(keyToImage);
    if (currentDraw == limitPerLevel) {
      // ignore: use_build_context_synchronously
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

  Future<void> save(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      var saved = await ImageGallerySaver.saveImage(
        pngBytes,
        quality: 100,
        name: DateTime.now().toIso8601String() + ".png",
        isReturnImagePathOfIOS: true,
      );
      print(saved);
    } catch (e) {
      print(e);
    }
  }

  void selectedColor(String tag, Color color) {
    currentTextColor = "Cor selecionada: $tag";
    currentColor = color;
    update(['color']);
  }

  String formatedTime(int time) {
    return time < 10 ? '0$time' : time.toString();
  }

  String getCurrentTime() {
    DateTime now = DateTime.now();
    return "${formatedTime(now.hour)}:${formatedTime(now.minute)}:${formatedTime(now.second)}";
  }

  void infos(Level level) {
    level.finalTime = getCurrentTime();
    print("titulo: ${level.title}");
    print("tentativas: ${level.attempts}");
    print("tempo:${level.initialTime} - ${level.finalTime}");
  }
}
