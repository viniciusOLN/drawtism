import 'package:drawtism/app/features/drawpage/domain/canvas_path.dart';
import 'package:drawtism/app/features/drawpage/domain/drawing.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawing_bloc/drawing_bloc.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawing_bloc/drawing_event.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawing_bloc/drawing_state.dart';
import 'package:drawtism/app/features/drawpage/presentation/settings_bloc/settings_bloc.dart';
import 'package:drawtism/app/features/drawpage/presentation/settings_bloc/settings_event.dart';
import 'package:drawtism/app/features/drawpage/presentation/settings_bloc/settings_state.dart';
import 'package:drawtism/app/features/drawpage/presentation/widgets/color_button.dart';
import 'package:drawtism/app/features/drawpage/presentation/widgets/row_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_painter.dart';

class PaintModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Voltar'),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: ClipPath(
                clipper: CanvasClipper(),
                child: BlocBuilder<DrawingBloc, DrawingState>(
                    builder: (ctx, state) {
                  return PaintCanvas(
                    initialdrawPoints: state.currentDrawing,
                  );
                }),
              ),
            ),
            ColumnButtons(),
          ],
        ),
      ),
    );
  }
}

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
    ..strokeWidth = 2
    ..color = Colors.black;

  CanvasPath _newPath = CanvasPath(
    paint: Paint()
      ..strokeWidth = 2
      ..color = Colors.black,
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
                  maxHeight: _size.height,
                  maxWidth: _size.width,
                ),
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}

class CanvasClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final _path = Path();
    _path.moveTo(0, 0);
    _path.lineTo(size.width, 0);

    _path.lineTo(size.width, size.height);

    _path.lineTo(0, size.height);
    _path.close();
    return _path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
