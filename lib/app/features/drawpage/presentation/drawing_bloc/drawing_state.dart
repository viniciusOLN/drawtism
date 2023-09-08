import '../widgets/canvas_path.dart';

abstract class DrawingState {
  DrawingState(this.currentDrawing);
  List<CanvasPath> currentDrawing;
}

class DrawingInitial extends DrawingState {
  DrawingInitial(List<CanvasPath> currentDrawing) : super(currentDrawing);
}

class DrawingLoading extends DrawingState {
  DrawingLoading(List<CanvasPath> currentDrawing) : super(currentDrawing);
}

class DrawingLoaded extends DrawingState {
  DrawingLoaded(List<CanvasPath> currentDrawing) : super(currentDrawing);
}
