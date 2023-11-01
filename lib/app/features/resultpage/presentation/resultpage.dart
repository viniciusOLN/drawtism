import 'package:drawtism/app/features/drawpage/presentation/controllers/drawing_controller.dart';
import 'package:drawtism/app/features/levelpage/presentation/levelpage.dart';
import 'package:drawtism/app/features/resultpage/presentation/domain/entities/result_entity.dart';
import 'package:drawtism/app/global/utils/colors.dart';
import 'package:drawtism/app/global/utils/deviceUtils.dart';
import 'package:drawtism/app/global/utils/levels.dart';
import 'package:drawtism/app/global/utils/text_styles.dart';
import 'package:drawtism/app/global/widgets/background.dart';
import 'package:drawtism/app/global/widgets/customText.dart';
import 'package:drawtism/app/global/widgets/default_button.dart';
import 'package:drawtism/app/global/widgets/default_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  InfosResult? result;
  ResultPage({super.key, this.result});

  @override
  Widget build(BuildContext context) {
    final controller = Get.lazyPut(
      () => DrawingPageController(),
    );
    final controllerReference = Get.find<DrawingPageController>();
    controllerReference.sendEmail();
    double width = DeviceUtils.width(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png"),
              //SizedBox(height: width * 0.010),
              CustomText(
                text: "Você completou o desafio",
                style: TextStyles.defaultStyle,
              ),
              CustomText(
                text: "PARABÉNS!!!!!",
                style: TextStyles.defaultStyle,
              ),
              SizedBox(height: width * 0.04),
              CustomText(
                text: "Quantidade de tentativas",
                style: TextStyles.defaultStyle,
              ),
              SizedBox(height: width * 0.04),
              CustomText(
                text: "1ª tarefa",
                style: TextStyles.defaultStyle,
              ),
              CustomText(
                text: result!.attempts[1].toString(),
                style: TextStyles.defaultStyle,
              ),
              SizedBox(height: width * 0.02),
              CustomText(
                text: "2ª tarefa",
                style: TextStyles.defaultStyle,
              ),
              CustomText(
                text: result!.attempts[2].toString(),
                style: TextStyles.defaultStyle,
              ),
              SizedBox(height: width * 0.02),
              CustomText(
                text: "3ª tarefa",
                style: TextStyles.defaultStyle,
              ),
              CustomText(
                text: result!.attempts[3].toString(),
                style: TextStyles.defaultStyle,
              ),
              SizedBox(height: width * 0.02),
              CustomText(
                text: "Cores Usadas",
                style: TextStyles.defaultStyle,
              ),
              CustomText(
                text: result!.usedColors.toString(),
                style: TextStyles.defaultStyle,
              ),
              SizedBox(height: width * 0.02),
              CustomText(
                text: "Deseja jogar outro nível?",
                style: TextStyles.defaultStyle,
              ),
              SizedBox(height: width * 0.04),
              CustomContainer(
                width: width * 0.70,
                children: [
                  CustomButton(
                    onPressed: () {
                      Get.delete<DrawingPageController>();
                      if (levels.length > result!.nextLevel) {
                        Navigator.pushNamed(
                          context,
                          '/drawpage',
                          arguments: {
                            'level': levels[result!.nextLevel],
                            'position': result!.nextLevel,
                          },
                        );
                        return;
                      }
                      Get.to(
                        () => LevelPage(
                          levels: levels,
                          isDrawPage: true,
                        ),
                      );
                    },
                    title: 'Clique Aqui',
                    style: TextStyles.whiteTextButtonStyle,
                    color: ColorStyle.buttonGreen,
                  ),
                  SizedBox(height: width * 0.02),
                  CustomButton(
                    onPressed: () {
                      Get.delete<DrawingPageController>();
                      Navigator.pushNamed(context, '/mode');
                    },
                    title: 'Sair',
                    style: TextStyles.whiteTextButtonStyle,
                    color: ColorStyle.buttonRed,
                  ),
                  SizedBox(height: width * 0.06),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
