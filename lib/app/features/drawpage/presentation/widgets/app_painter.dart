import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

import 'canvas_path.dart';
import 'drawing.dart';

class AppPainter extends CustomPainter {
  final Drawing drawing;

  AppPainter({
    required this.drawing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final List<CanvasPath> canvasPaths = drawing.canvasPaths;

    var _paint = Paint();

    if (canvasPaths.isNotEmpty) {
      canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());

      //!draw all the paths
      canvasPaths.forEach((CanvasPath canvasPath) {
        if (canvasPath.drawPoints.isNotEmpty) {
          final Paint currentPathSettings = canvasPath.paint;

          _paint = canvasPath.paint..style = PaintingStyle.stroke;

          //some value for radius based on experimenting lol
          final _raidus = math.sqrt(currentPathSettings.strokeWidth) / 20;

          canvas.drawPath(canvasPath.path, _paint);

          if (currentPathSettings.strokeWidth > 1)
            // ignore: curly_braces_in_flow_control_structures
            for (int i = 0; i < canvasPath.drawPoints.length - 1; i++) {
              // canvas.drawLine(canvasPath.drawPoints[i],
              //     canvasPath.drawPoints[i + 1], _paint);
              canvas.drawCircle(
                  canvasPath.drawPoints[i],
                  currentPathSettings.strokeWidth < 1
                      ? currentPathSettings.strokeWidth
                      : _raidus,
                  _paint);
            }
        }
      });
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant AppPainter oldDelegate) => true;
}
