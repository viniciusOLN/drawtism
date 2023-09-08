import 'dart:async';
import 'package:bloc/bloc.dart';

import '../widgets/drawing.dart';
import 'drawing_event.dart';
import 'drawing_state.dart';

class DrawingBloc extends Bloc<DrawingEvent, DrawingState> {
  DrawingBloc() : super(DrawingInitial(const []));

  Drawing _drawing = Drawing(canvasPaths: []);

  @override
  Stream<DrawingState> mapEventToState(
    DrawingEvent event,
  ) async* {
    if (event is UpdateDrawing) {
      yield DrawingLoading(_drawing.canvasPaths);
      _drawing.canvasPaths.last = event.canvasPath;
      yield DrawingLoaded(_drawing.canvasPaths);
    } else if (event is StartDrawing) {
      yield DrawingLoading(_drawing.canvasPaths);
      _drawing.canvasPaths.add(event.canvasPath);
      yield DrawingLoaded(_drawing.canvasPaths);
    } else if (event is Undo) {
      if (_drawing.canvasPaths.isNotEmpty) {
        yield DrawingLoading(_drawing.canvasPaths);
        _drawing.canvasPaths.removeRange(0, _drawing.canvasPaths.length);
        yield DrawingLoaded(_drawing.canvasPaths);
      }
    }
  }
}
