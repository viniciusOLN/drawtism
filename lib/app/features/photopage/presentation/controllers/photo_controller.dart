import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:drawtism/app/features/choosepage/presentation/choosepage.dart';
import 'package:drawtism/app/features/drawpage/domain/entities/email_sender.dart';
import 'package:drawtism/app/features/levelpage/presentation/levelpage.dart';
import 'package:drawtism/app/features/photopage/previewpage/presentation/preview_page.dart';
import 'package:drawtism/app/global/utils/formate_date.dart';
import 'package:drawtism/app/global/utils/levels_photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhotoController extends GetxController {
  late File newPhoto;
  String innitialTime = "";

  void showPreview(BuildContext context, File file, String image) async {
    file = await Get.to(PreviewPage(file: file));
    Uint8List bytesImage = (await rootBundle.load(image)).buffer.asUint8List();

    if (file != null) {
      Uint8List bytes = file.readAsBytesSync();
      sendEmail(base64Encode(bytes), base64Encode(bytesImage));
      Get.to(
        () => LevelPage(
          levelsPhotoPhage: levelsPhoto,
          isDrawPage: false,
        ),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Imagem salva com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void showPreviewBalance(BuildContext context, File file) async {
    file = await Get.to(PreviewPage(file: file));
    if (file != null) {
      Uint8List bytes = file.readAsBytesSync();
      sendEmailBalance(base64Encode(bytes));
      Get.to(() => ChooseMode());
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Imagem salva com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void sendEmail(String image, String imageToComparate) async {
    final prefs = await SharedPreferences.getInstance();

    String username = prefs.getString("username") ?? "";
    //String email = prefs.getString("email") ?? "";

    EmailSender emailSender = EmailSender(
      subject: "Aquarela Autista - $username ${DateTime.now()}",
      toAddress: "autistaaquarela@gmail.com",
      attachments: [
        Attachment(
          image,
          "AtividadeAMao_$username.jpg",
        ),
        Attachment(
          imageToComparate,
          "Atividade$username.png",
        ),
      ],
      contents: [
        Content("text/html",
            "Atividade feita a mão.<br><br> Tempo de Início da atividade: $innitialTime <br><br> Tempo de finalização da atividade: ${getCurrentTime()}"),
      ],
    );

    emailSender.sendEmail();
  }

  void sendEmailBalance(String image) async {
    final prefs = await SharedPreferences.getInstance();

    String username = prefs.getString("username") ?? "";
    //String email = prefs.getString("email") ?? "";

    EmailSender emailSender = EmailSender(
      subject: "Aquarela Autista - $username ${DateTime.now()}",
      toAddress: "autistaaquarela@gmail.com",
      attachments: [
        Attachment(
          image,
          "Nivelamento_$username.jpg",
        ),
      ],
      contents: [
        Content("text/html", "Imagem de nivelamento."),
      ],
    );

    emailSender.sendEmail();
  }
}
