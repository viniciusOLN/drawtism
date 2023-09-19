import 'package:drawtism/app/features/drawpage/presentation/controllers/drawing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../drawing_bloc/drawing_bloc.dart';
import '../drawing_bloc/drawing_state.dart';
import 'canvas_clipper.dart';
import 'paint_canvas.dart';
import 'row_buttons.dart';

class PaintModule extends StatelessWidget {
  DrawingPageController controller;
  PaintModule({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipPath(
            clipper: CanvasClipper(),
            child:
                BlocBuilder<DrawingBloc, DrawingState>(builder: (ctx, state) {
              return PaintCanvas(
                initialdrawPoints: state.currentDrawing,
              );
            }),
          ),
        ),
        ColumnButtons(controller: controller),
      ],
    );
  }
}
