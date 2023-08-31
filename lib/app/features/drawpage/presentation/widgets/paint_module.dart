import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../drawing_bloc/drawing_bloc.dart';
import '../drawing_bloc/drawing_state.dart';
import 'canvas_clipper.dart';
import 'paint_canvas.dart';
import 'row_buttons.dart';

class PaintModule extends StatelessWidget {
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
        const ColumnButtons(),
      ],
    );
  }
}
