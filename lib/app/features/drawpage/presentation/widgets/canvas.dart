import 'package:drawtism/app/features/drawpage/presentation/widgets/drawLine.dart';
import 'package:flutter/material.dart';

class CustomCanvas extends CustomPainter {
  final List<DrawnLine> lines;

  CustomCanvas(this.lines);
  // 2
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.redAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < lines.length; ++i) {
      if (lines[i] == null) continue;
      for (int j = 0; j < lines[i].path.length - 1; ++j) {
        paint.color = lines[i].color;
        paint.strokeWidth = lines[i].width;
        canvas.drawLine(lines[i].path[j], lines[i].path[j + 1], paint);
      }
    }
  }

  // 4
  @override
  bool shouldRepaint(CustomCanvas delegate) {
    return true;
  }
}
