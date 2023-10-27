import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'canvas_path.dart';
import 'drawing.dart';
import '../drawing_bloc/drawing_bloc.dart';
import '../drawing_bloc/drawing_event.dart';
import '../drawing_bloc/drawing_state.dart';
import '../settings_bloc/settings_bloc.dart';
import '../settings_bloc/settings_state.dart';
import 'app_painter.dart';

class PaintCanvas extends StatefulWidget {
  final List<CanvasPath> initialdrawPoints;

  const PaintCanvas({
    Key? key,
    this.initialdrawPoints = const [],
  }) : super(key: key);

  @override
  _PaintCanvasState createState() => _PaintCanvasState();
}

class _PaintCanvasState extends State<PaintCanvas> {
  Paint _currentPaintSettings = Paint()
    ..strokeWidth = 6
    ..color = Colors.black;

  CanvasPath _newPath = CanvasPath(
    paint: Paint()
      ..strokeWidth = 6
      ..color = Colors.transparent,
    drawPoints: [],
  );

  void addPoint(Offset newPoint) {
    _newPath.quadric(
      newPoint.dx,
      newPoint.dy,
    );
    _newPath.drawPoints.add(newPoint);
    BlocProvider.of<DrawingBloc>(context).add(UpdateDrawing(_newPath));
  }

  void addLastPoint() {
    final Offset _lastOffset = _newPath.drawPoints.last;

    final Offset _additionalOffset =
        Offset(_lastOffset.dx + 10, _lastOffset.dy + 10);

    _newPath.drawPoints.add(_additionalOffset);
    BlocProvider.of<DrawingBloc>(context).add(UpdateDrawing(_newPath));
  }

  Paint _paintFrom(Paint paint) {
    return Paint()
      ..color = paint.color
      ..strokeWidth = paint.strokeWidth
      ..blendMode = paint.blendMode
      ..strokeCap = paint.strokeCap
      ..shader = paint.shader;
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _drawingBloc = BlocProvider.of<DrawingBloc>(context);

    return BlocBuilder<DrawingBloc, DrawingState>(
      builder: (context, state) {
        return CustomPaint(
          isComplex: true,
          willChange: true,
          foregroundPainter: AppPainter(
            drawing: Drawing(
              canvasPaths: state.currentDrawing,
            ),
          ),
          child: BlocListener<SettingsBloc, SettingsState>(
            listener: (context, state) {
              _currentPaintSettings = state.paintSettings;
            },
            child: GestureDetector(
              onPanStart: (det) {
                _newPath = CanvasPath(
                    paint: _paintFrom(_currentPaintSettings),
                    drawPoints: [
                      det.localPosition,
                    ]);
                _newPath.movePathTo(det.localPosition.dx, det.localPosition.dy);

                _drawingBloc.add(StartDrawing(_newPath));
              },
              onPanUpdate: (det) => addPoint(
                Offset(det.localPosition.dx, det.localPosition.dy),
              ),
              onPanEnd: (det) => addLastPoint(),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: _size.height / 1.6,
                  maxWidth: _size.width / 1.6,
                ),
                color: Colors.transparent,
              ),
            ),
          ),
        );
      },
    );
  }
}
