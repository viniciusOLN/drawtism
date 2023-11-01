import 'dart:convert';

import 'package:drawtism/app/features/configpage/presentation/controllers/config_page_controller.dart';
import 'package:drawtism/app/global/utils/formate_date.dart';
import 'package:drawtism/music_controller.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../domain/entities/email_sender.dart';
import '../../domain/entities/infos_email.dart';
import '../../domain/entities/level.dart';
import '../../../resultpage/presentation/domain/entities/result_entity.dart';
import '../../../resultpage/presentation/resultpage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawingPageController extends GetxController {
  int currentDraw = 0;
  int currentLevel = 0;
  int countUsedColors = 0;
  int limitPerLevel = 2;
  bool isPainted = false;
  Set listUsedColors = {};
  String colorButton = "";
  String currentColorSelected = "";
  List<String> listPathImages = [];
  List<String> listIdentifyTask = [];
  Map<int, dynamic> attempts = {
    1: 0,
    2: 0,
    3: 0,
  };
  Map<int, dynamic> duration = {
    1: {'init': '', 'end': ''},
    2: {'init': '', 'end': ''},
    3: {'init': '', 'end': ''},
  };
  late GlobalKey keyToImage;
  String currentTextColor = "Escolha uma cor!";
  Color currentColor = const Color.fromRGBO(54, 60, 204, 1);
  final controllerReference = Get.lazyPut(
    () => MusicController(),
  );
  final controller = Get.find<MusicController>();
  final controllerReferencea = Get.lazyPut(
    () => ConfigPageController(),
  );
  final controllerConfig = Get.find<ConfigPageController>();
  FlutterTts flutterTts = FlutterTts();

  void nextDraw(BuildContext context) async {
    changeButton(false);
    await save(keyToImage);
    await flutterTts.stop();
    if (currentDraw == limitPerLevel) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            result: InfosResult(
              attempts: attempts,
              usedColors: listUsedColors.length,
              nextLevel: currentLevel + 1,
            ),
          ),
        ),
      );
      return;
    }
    currentDraw++;
    currentLevel++;
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
      listPathImages.add(base64Encode(pngBytes));
    } catch (e) {
      print(e);
    }
  }

  void selectedColor(String tag, Color color) {
    currentTextColor = "Cor selecionada: $tag";
    currentColor = color;
    update(['color']);
  }

  void infos(Level level) {
    level.finalTime = getCurrentTime();
    listIdentifyTask.add(level.identifyTask);
    duration[currentDraw + 1]['init'] = level.initialTime;
    duration[currentDraw + 1]['end'] = level.finalTime;
  }

  void changeButton(bool state) {
    isPainted = state;
    update(['nextButton']);
  }

  void registerAttempt() {
    if (isPainted) {
      int attempt = attempts[currentDraw + 1];
      attempts[currentDraw + 1] = attempt + 1;
      changeButton(false);
    }
  }

  void sendEmail() async {
    final prefs = await SharedPreferences.getInstance();

    String username = prefs.getString("username") ?? "";
    //String email = prefs.getString("email") ?? "";

    if (username.isEmpty) {
      return;
    }

    InfosEmail infos = InfosEmail(
      username: username,
      attempts: attempts.length,
      listAttempts: attempts,
      timeDurations: duration,
    );

    EmailSender emailSender = EmailSender(
      subject: "Aquarela Autista - $username",
      toAddress: "autistaaquarela@gmail.com",
      attachments: List.generate(
        listPathImages.length,
        (index) => Attachment(
          listPathImages[index],
          "${listIdentifyTask[index]}.jpg",
        ),
      ),
      contents: [
        Content(
          "text/html",
          EmailSender.templateEmail(infos),
        ),
      ],
    );

    emailSender.sendEmail();
  }

  void speak(String text) async {
    await controller.playerThemeSong.pause();

    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setLanguage('pt-BR');
    await flutterTts.speak(text).then((value) {
      if (controllerConfig.isPlaying) {
        Timer(const Duration(seconds: 5), () {
          controller.playerThemeSong.resume();
        });
      }
    });
  }
}
