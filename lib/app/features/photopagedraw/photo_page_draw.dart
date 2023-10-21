import 'package:drawtism/app/features/drawpage/domain/entities/level.dart';
import 'package:drawtism/app/features/drawpage/presentation/widgets/widget_to_image.dart';
import 'package:drawtism/app/features/levelpage/presentation/levelpage.dart';
import 'package:drawtism/app/features/photopage/presentation/photopage.dart';
import 'package:drawtism/app/features/photopagedraw/controllers/photo_page_draw_controller.dart';
import 'package:drawtism/app/global/utils/colors.dart';
import 'package:drawtism/app/global/utils/deviceUtils.dart';
import 'package:drawtism/app/global/utils/formate_date.dart';
import 'package:drawtism/app/global/utils/levels_photos.dart';
import 'package:drawtism/app/global/utils/text_styles.dart';
import 'package:drawtism/app/global/widgets/default_button.dart';
import 'package:drawtism/app/global/widgets/default_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoPageDraw extends StatelessWidget {
  Level level;
  int indexLevel;
  PhotoPageDraw({
    required this.level,
    required this.indexLevel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.width(context);
    final controllerReference = Get.lazyPut(
      () => PhotoPageDrawController(),
    );
    final controller = Get.find<PhotoPageDrawController>();
    controller.currentTime = getCurrentTime();
    controller.speak(level.title);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Voltar'),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          color: Theme.of(context).iconTheme.color,
          onPressed: () {
            Get.to(
              () => LevelPage(
                levelsPhotoPhage: levelsPhoto,
                isDrawPage: false,
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<PhotoPageDrawController>(
          id: 'board',
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: width * 0.25),
                Text(
                  "Faça o desenho abaixo em um papel!",
                  style: TextStyles.blackTextGeneric,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: width * 0.3),
                WidgetToImage(
                  builder: (key) {
                    controller.keyToImage = key;
                    return Image.asset(
                      level.urlImage,
                    );
                  },
                ),
                SizedBox(height: width * 0.4),
                CustomContainer(
                  width: width * 0.81,
                  children: [
                    CustomButton(
                      onPressed: () {
                        Get.to(
                          () => PhotoPage(
                            urlImage: level.urlImage,
                            currentTime: controller.currentTime,
                          ),
                        );
                      },
                      title: 'Tirar Foto do Desenho',
                      style: TextStyles.whiteTextButtonStyle,
                      color: ColorStyle.buttonRed,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
