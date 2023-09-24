import 'dart:io';
import 'dart:typed_data';

import 'package:drawtism/app/features/photopage/previewpage/presentation/preview_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver_v3/image_gallery_saver.dart';

class PhotoController extends GetxController {
  late File newPhoto;

  void showPreview(BuildContext context, File file) async {
    file = await Get.to(PreviewPage(file: file));

    if (file != null) {
      Uint8List bytes = file.readAsBytesSync();
      var saved = await ImageGallerySaver.saveImage(
        bytes,
        quality: 100,
        name: DateTime.now().toIso8601String() + ".png",
        isReturnImagePathOfIOS: true,
      );
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
}
