import 'dart:convert';

import 'package:drawtism/app/features/drawpage/domain/entities/email_sender.dart';
import 'package:drawtism/app/features/drawpage/domain/entities/infos_email.dart';
import 'package:drawtism/app/features/drawpage/domain/entities/level.dart';
import 'package:drawtism/app/features/resultpage/presentation/domain/entities/result_entity.dart';
import 'package:drawtism/app/features/resultpage/presentation/resultpage.dart';
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
  List listUsedColors = [];
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
  Color currentColor = Color.fromRGBO(54, 60, 204, 1);

  void nextDraw(BuildContext context) async {
    changeButton(false);
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

  String formatedTime(int time) => time < 10 ? '0$time' : time.toString();

  String getCurrentTime() {
    DateTime now = DateTime.now();
    return "${formatedTime(now.hour)}:${formatedTime(now.minute)}:${formatedTime(now.second)}";
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
    String email = prefs.getString("email") ?? "";

    if (username.isEmpty || email.isEmpty) {
      return;
    }

    InfosEmail infos = InfosEmail(
      username: username,
      attempts: attempts.length,
      listAttempts: attempts,
      timeDurations: duration,
    );

    EmailSender emailSender = EmailSender(
      subject: "Aquarela Autista - $username ${DateTime.now()}",
      toAddress: email,
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
}
