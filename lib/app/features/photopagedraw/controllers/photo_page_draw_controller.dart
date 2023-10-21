import 'dart:async';

import 'package:drawtism/music_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class PhotoPageDrawController extends GetxController {
  late GlobalKey keyToImage;
  int currentDraw = 0;
  String currentTime = "";
  final controllerReference = Get.lazyPut(
    () => MusicController(),
  );
  final controller = Get.find<MusicController>();

  void speak(String text) async {
    controller.playerThemeSong.setVolume(0);
    FlutterTts flutterTts = FlutterTts();

    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(2);
    await flutterTts.setLanguage('pt-BR');
    await flutterTts.speak(text);

    Timer(Duration(seconds: 8), () {
      controller.playerThemeSong.setVolume(1);
    });
  }
}
