import 'package:camera_camera/camera_camera.dart';
import 'package:drawtism/app/features/photopage/presentation/controllers/photo_controller.dart';
import 'package:drawtism/app/features/photopage/previewpage/presentation/preview_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.lazyPut(
      () => PhotoController(),
    );
    final controllerReference = Get.find<PhotoController>();
    return CameraCamera(onFile: (file) {
      print(file);
      controllerReference.showPreview(context, file);
    });
  }
}
