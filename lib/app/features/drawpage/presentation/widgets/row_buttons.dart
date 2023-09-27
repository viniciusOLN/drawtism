import 'package:drawtism/app/features/drawpage/presentation/controllers/drawing_controller.dart';
import 'package:drawtism/app/features/drawpage/presentation/settings_bloc/settings_bloc.dart';
import 'package:drawtism/app/features/drawpage/presentation/settings_bloc/settings_event.dart';
import 'package:drawtism/app/features/drawpage/presentation/widgets/color_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ColumnButtons extends StatelessWidget {
  DrawingPageController controller;
  ColumnButtons({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final controllerReference = Get.find<DrawingPageController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ColorButton(
          tag: '1',
          color: Colors.black,
          controller: controller,
        ),
        ColorButton(
          tag: '2',
          color: Colors.red,
          controller: controller,
        ),
        ColorButton(
          tag: '3',
          color: Color.fromARGB(255, 215, 86, 11),
          controller: controller,
        ),
        ColorButton(
          tag: '3',
          color: Color.fromARGB(255, 0, 26, 255),
          controller: controller,
        ),
        ColorButton(
          tag: '3',
          color: Color.fromARGB(255, 55, 245, 2),
          controller: controller,
        ),
        TextButton(
          onPressed: () {
            Paint newPaint = Paint()..blendMode = BlendMode.clear;
            newPaint.strokeWidth = 10;
            BlocProvider.of<SettingsBloc>(context).add(
              SettingsChanged(newPaint),
            );
          },
          child: const Text('borracha'),
        ),
        /*TextButton(
          onPressed: () {
            BlocProvider.of<SettingsBloc>(context).add(
              SettingsStrokeWidthChanged(-0.5),
            );
          },
          child: Text('-0.5'),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<SettingsBloc>(context)
                .add(SettingsStrokeWidthChanged(0.5));
          },
          child: Text('+0.5'),
        ),*/
      ],
    );
  }
}
