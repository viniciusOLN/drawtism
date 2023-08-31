import '../../domain/canvas_path.dart';

abstract class DrawingEvent {
  const DrawingEvent();
}

class SaveDrawing extends DrawingEvent {}

class PreviousDrawing extends DrawingEvent {}

class NextDrawing extends DrawingEvent {}

class Undo extends DrawingEvent {}

class UpdateDrawing extends DrawingEvent {
  final CanvasPath canvasPath;
  const UpdateDrawing(this.canvasPath);
}

class StartDrawing extends DrawingEvent {
  final CanvasPath canvasPath;
  const StartDrawing(this.canvasPath);
}
