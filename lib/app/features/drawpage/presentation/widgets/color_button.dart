import 'package:drawtism/app/features/drawpage/presentation/controllers/drawing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../settings_bloc/settings_bloc.dart';
import '../settings_bloc/settings_event.dart';

class ColorButton extends StatefulWidget {
  String tag;
  Color color;
  DrawingPageController controller;

  ColorButton({
    super.key,
    required this.tag,
    required this.color,
    required this.controller,
  });

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FloatingActionButton(
        heroTag: widget.tag,
        mini: true,
        backgroundColor: widget.color,
        onPressed: () {
          if (!widget.controller.listUsedColors.contains(widget.tag)) {
            widget.controller.countUsedColors++;
            widget.controller.listUsedColors.add(widget.tag);
          }

          Paint newPaint = Paint()
            ..color = widget.color
            ..blendMode = BlendMode.srcOver;

          BlocProvider.of<SettingsBloc>(context).add(
            SettingsChanged(newPaint),
          );

          widget.controller.selectedColor(widget.tag, widget.color);
        },
        child: Container(),
      ),
    );
  }
}
