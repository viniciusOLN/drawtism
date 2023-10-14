import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:drawtism/app/features/drawpage/domain/entities/email_sender.dart';
import 'package:drawtism/app/features/photopage/previewpage/presentation/preview_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver_v3/image_gallery_saver.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhotoController extends GetxController {
  late File newPhoto;

  void showPreview(BuildContext context, File file) async {
    file = await Get.to(PreviewPage(file: file));

    if (file != null) {
      Uint8List bytes = file.readAsBytesSync();
      sendEmail(base64Encode(bytes));
      Get.back();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Imagem salva com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void sendEmail(String image) async {
    final prefs = await SharedPreferences.getInstance();

    String username = prefs.getString("username") ?? "";
    String email = prefs.getString("email") ?? "";

    EmailSender emailSender = EmailSender(
      subject: "Aquarela Autista - $username ${DateTime.now()}",
      toAddress: email,
      attachments: [
        Attachment(
          image,
          "AtividadeAMao_$username.jpg",
        ),
      ],
      contents: [
        Content("text/html", "Atividade feita a mão."),
      ],
    );

    emailSender.sendEmail();
  }
}
