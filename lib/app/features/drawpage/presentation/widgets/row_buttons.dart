import 'package:drawtism/app/features/drawpage/presentation/drawing_bloc/drawing_bloc.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawing_bloc/drawing_event.dart';
import 'package:drawtism/app/features/drawpage/presentation/settings_bloc/settings_bloc.dart';
import 'package:drawtism/app/features/drawpage/presentation/settings_bloc/settings_event.dart';
import 'package:drawtism/app/features/drawpage/presentation/widgets/color_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColumnButtons extends StatelessWidget {
  const ColumnButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ColorButton(
          color: Colors.black,
        ),
        ColorButton(
          color: Colors.red,
        ),
        TextButton(
          onPressed: () => BlocProvider.of<SettingsBloc>(context).add(
            SettingsChanged(
              Paint()..blendMode = BlendMode.clear,
            ),
          ),
          child: Text('borracha'),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<SettingsBloc>(context)
                .add(SettingsStrokeWidthChanged(-0.5));
          },
          child: Text('-0.5'),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<SettingsBloc>(context)
                .add(SettingsStrokeWidthChanged(0.5));
          },
          child: Text('+0.5'),
        ),
        TextButton(
          onPressed: () => BlocProvider.of<DrawingBloc>(context).add(
            Undo(),
          ),
          child: Text('desfazer'),
        ),
      ],
    );
  }
}
