import 'package:drawtism/app/features/drawpage/domain/entities/level.dart';
import 'package:drawtism/app/features/drawpage/presentation/controllers/drawing_controller.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawing_bloc/drawing_bloc.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawing_bloc/drawing_event.dart';
import 'package:drawtism/app/features/drawpage/presentation/widgets/row_buttons.dart';
import 'package:drawtism/app/features/drawpage/presentation/widgets/widget_to_image.dart';
import 'package:drawtism/app/features/levelpage/presentation/levelpage.dart';
import 'package:drawtism/app/global/utils/colors.dart';
import 'package:drawtism/app/global/utils/deviceUtils.dart';
import 'package:drawtism/app/global/utils/formate_date.dart';
import 'package:drawtism/app/global/utils/levels.dart';
import 'package:drawtism/app/global/utils/text_styles.dart';
import 'package:drawtism/app/global/widgets/default_button.dart';
import 'package:drawtism/app/global/widgets/default_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import 'widgets/paint_module.dart';

class DrawPage extends StatelessWidget {
  final controller = Get.lazyPut(
    () => DrawingPageController(),
  );
  final controllerReference = Get.find<DrawingPageController>();
  DrawPage({super.key});

  void stopVoice() async {
    await controllerReference.flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.width(context);
    final level = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    Level currentLevel = level['level'].listTasks[0] as Level;
    currentLevel.attempts = 0;
    controllerReference.currentLevel = level["position"];
    controllerReference.colorButton = "preto";
    controllerReference.selectedColor("preto", Colors.black);
    // print(level["level"].listTasks[level["position"]].title);

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
            stopVoice();
            Get.to(
              () => LevelPage(
                levels: levels,
                isDrawPage: true,
              ),
            );
          },
        ),
      ),
      body: GetBuilder<DrawingPageController>(
        id: 'board',
        builder: (_) {
          currentLevel.initialTime = getCurrentTime();
          controllerReference.speak(
            level["level"].listTasks[controllerReference.currentDraw].title,
          );
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: width * 0.190),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    level["level"]
                        .listTasks[controllerReference.currentDraw]
                        .title,
                    style: TextStyles.blackTextGeneric,
                    textAlign: TextAlign.center,
                  ),
                ),
                WidgetToImage(builder: (key) {
                  controllerReference.keyToImage = key;
                  return Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        level["level"]
                            .listTasks[controllerReference.currentDraw]
                            .urlImage,
                      ),
                      PaintModule(),
                    ],
                  );
                }),
                GetBuilder<DrawingPageController>(
                  id: 'color',
                  builder: (_) {
                    return Text(
                      controllerReference.currentTextColor,
                      style: TextStyles.blueTextGeneric.copyWith(
                        color: controllerReference.currentColor,
                      ),
                    );
                  },
                ),
                SizedBox(height: width * 0.060),
                ColumnButtons(controller: controllerReference),
                SizedBox(height: width * 0.090),
                CustomContainer(
                  width: width * 0.81,
                  children: [
                    CustomButton(
                      onPressed: () {
                        currentLevel.attempts = (currentLevel.attempts! + 1);
                        controllerReference.registerAttempt();
                        BlocProvider.of<DrawingBloc>(context).add(
                          Undo(),
                        );
                      },
                      title: 'Apagar',
                      style: TextStyles.whiteTextButtonStyle,
                      color: ColorStyle.buttonRed,
                    ),
                  ],
                ),
                SizedBox(height: width * 0.025),
                GetBuilder<DrawingPageController>(
                  id: 'nextButton',
                  builder: (_) {
                    return CustomContainer(
                      width: width * 0.81,
                      children: [
                        CustomButton(
                          onPressed: controllerReference.isPainted
                              ? () {
                                  controllerReference.infos(currentLevel);
                                  controllerReference.nextDraw(context);
                                  BlocProvider.of<DrawingBloc>(context).add(
                                    Undo(),
                                  );
                                  currentLevel.attempts = 0;
                                }
                              : () {},
                          title: 'Continuar',
                          style: TextStyles.whiteTextButtonStyle,
                          color: controllerReference.isPainted
                              ? ColorStyle.buttonGreen
                              : ColorStyle.buttonDisabled,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
