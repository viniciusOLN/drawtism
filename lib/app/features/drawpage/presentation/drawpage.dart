import 'package:drawtism/app/features/drawpage/presentation/controllers/drawing_controller.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawing_bloc/drawing_bloc.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawing_bloc/drawing_event.dart';
import 'package:drawtism/app/global/utils/colors.dart';
import 'package:drawtism/app/global/utils/deviceUtils.dart';
import 'package:drawtism/app/global/utils/text_styles.dart';
import 'package:drawtism/app/global/widgets/default_button.dart';
import 'package:drawtism/app/global/widgets/default_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'widgets/paint_module.dart';

class DrawPage extends StatelessWidget {
  final controller = Get.lazyPut(
    () => DrawingPageController(),
  );
  final controllerReference = Get.find<DrawingPageController>();

  DrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.width(context);
    final level = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    // print(level["level"].listTasks[level["position"]].title);

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Voltar'),
      ),
      body: GetBuilder<DrawingPageController>(
        id: 'board',
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: width * 0.090),
              Text(level["level"]
                  .listTasks[controllerReference.currentDraw]
                  .title),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    level["level"]
                        .listTasks[controllerReference.currentDraw]
                        .urlImage,
                  ),
                  PaintModule(),
                ],
              ),
              CustomContainer(
                width: width * 0.81,
                children: [
                  CustomButton(
                    onPressed: () => BlocProvider.of<DrawingBloc>(context).add(
                      Undo(),
                    ),
                    title: 'Apagar',
                    style: TextStyles.whiteTextButtonStyle,
                    color: ColorStyle.buttonRed,
                  ),
                ],
              ),
              SizedBox(height: width * 0.025),
              CustomContainer(
                width: width * 0.81,
                children: [
                  CustomButton(
                    onPressed: () {
                      controllerReference.nextDraw();
                      BlocProvider.of<DrawingBloc>(context).add(
                        Undo(),
                      );
                    },
                    title: 'Continuar',
                    style: TextStyles.whiteTextButtonStyle,
                    color: ColorStyle.buttonBlue,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
