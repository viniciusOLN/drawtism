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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ColorButton(
            tag: 'preto',
            color: Colors.black,
            controller: controller,
          ),
          ColorButton(
            tag: 'vermelho',
            color: Colors.red,
            controller: controller,
          ),
          ColorButton(
            tag: 'laranja',
            color: Color.fromARGB(253, 253, 150, 1),
            controller: controller,
          ),
          ColorButton(
            tag: 'azul',
            color: Color.fromRGBO(81, 175, 247, 1),
            controller: controller,
          ),
          ColorButton(
            tag: 'verde',
            color: const Color.fromRGBO(120, 157, 99, 1),
            controller: controller,
          ),
          TextButton(
            onPressed: () {
              Paint newPaint = Paint()..blendMode = BlendMode.clear;
              newPaint..strokeWidth = 200;
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
      ),
    );
  }
}
