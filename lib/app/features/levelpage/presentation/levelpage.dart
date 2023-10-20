import 'package:drawtism/app/features/choosepage/presentation/choosepage.dart';
import 'package:drawtism/app/features/drawpage/domain/entities/level.dart';
import 'package:drawtism/app/features/drawpage/domain/entities/levels.dart';
import 'package:drawtism/app/features/drawpage/presentation/controllers/drawing_controller.dart';
import 'package:drawtism/app/features/photopagedraw/photo_page_draw.dart';
import 'package:drawtism/app/global/utils/levels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/utils/colors.dart';
import '../../../global/utils/deviceUtils.dart';
import '../../../global/utils/text_styles.dart';
import '../../../global/widgets/background.dart';
import '../../../global/widgets/customText.dart';
import '../../../global/widgets/default_button.dart';
import '../../../global/widgets/default_container.dart';

class LevelPage extends StatelessWidget {
  List<Level>? levelsPhotoPhage;
  List<Levels>? levels;
  bool? isDrawPage;
  LevelPage({this.levels, this.isDrawPage, this.levelsPhotoPhage, super.key});

  @override
  Widget build(BuildContext context) {
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
            Get.to(() => const ChooseMode());
          },
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: width * 0.090),
              Image.asset("assets/images/logo.png"),
              SizedBox(height: width * 0.030),
              CustomText(
                text: "Escolha um nível",
                style: TextStyles.defaultStyle,
              ),
              SizedBox(height: width * 0.06),
              CustomContainer(
                width: width * 0.76,
                children: List.generate(
                    isDrawPage! ? levels!.length : levelsPhotoPhage!.length,
                    (index) {
                  index = index + 1;
                  return Column(
                    children: [
                      CustomButton(
                        onPressed: isDrawPage!
                            ? () {
                                Get.delete<DrawingPageController>();
                                Navigator.pushNamed(
                                  context,
                                  '/drawpage',
                                  arguments: {
                                    'level': levels![index - 1],
                                    'position': index - 1,
                                  },
                                );
                              }
                            : () {
                                Get.to(
                                  () => PhotoPageDraw(
                                    level: levelsPhotoPhage![index - 1],
                                    indexLevel: index - 1,
                                  ),
                                );
                              },
                        title: 'nível $index',
                        style: TextStyles.blueTextButtonStyle,
                        color: ColorStyle.buttonWhite,
                        imageUrl: 'assets/images/icons/blue_star.png',
                      ),
                      SizedBox(height: width * 0.02),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
