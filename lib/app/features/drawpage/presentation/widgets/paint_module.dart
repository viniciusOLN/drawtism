import 'package:drawtism/app/features/drawpage/presentation/controllers/drawing_controller.dart';
import 'package:drawtism/app/global/utils/deviceUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../drawing_bloc/drawing_bloc.dart';
import '../drawing_bloc/drawing_state.dart';
import 'canvas_clipper.dart';
import 'paint_canvas.dart';
import 'row_buttons.dart';

class PaintModule extends StatelessWidget {
  PaintModule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.width(context);
    return Row(
      children: [
        SizedBox(
          width: width,
          height: width / 1.1,
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
      ],
    );
  }
}
