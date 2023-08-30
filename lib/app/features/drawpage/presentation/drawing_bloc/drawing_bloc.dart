import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawing_bloc/drawing_event.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawing_bloc/drawing_state.dart';

import '../../domain/drawing.dart';

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
        _drawing.canvasPaths.removeLast();
        yield DrawingLoaded(_drawing.canvasPaths);
      }
    }
  }
}
