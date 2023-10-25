import 'package:camera_camera/camera_camera.dart';
import 'package:drawtism/app/features/photopage/presentation/controllers/photo_controller.dart';
import 'package:drawtism/app/global/utils/deviceUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BalanceLevelPage extends StatelessWidget {
  const BalanceLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.lazyPut(
      () => PhotoController(),
    );
    final controllerReference = Get.find<PhotoController>();
    double width = DeviceUtils.width(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Voltar'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          color: Theme.of(context).iconTheme.color,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: [
          CameraCamera(
            onFile: (file) {
              controllerReference.showPreviewBalance(context, file);
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color.fromARGB(81, 0, 0, 0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      "Tire foto do desenho que você fez!",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: width / 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
