import 'dart:async';

import 'package:drawtism/app/features/configpage/presentation/controllers/config_page_controller.dart';
import 'package:drawtism/music_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class PhotoPageDrawController extends GetxController {
  late GlobalKey keyToImage;
  int currentDraw = 0;
  String currentTime = "";
  FlutterTts flutterTts = FlutterTts();
  final controllerReference = Get.lazyPut(
    () => MusicController(),
  );
  final controller = Get.find<MusicController>();
  final controllerReferencea = Get.lazyPut(
    () => ConfigPageController(),
  );
  final controllerConfig = Get.find<ConfigPageController>();

  void speak(String text) async {
    await controller.playerThemeSong.pause();

    await flutterTts.setVolume(1.0);
    await flutterTts.setLanguage('pt-BR');
    await flutterTts.speak(text);
    if (controllerConfig.isPlaying) {
      Timer(const Duration(seconds: 8), () {
        controller.playerThemeSong.resume();
      });
    }
  }
}
