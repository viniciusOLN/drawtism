import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global/utils/generate_key.dart';
import '../settings_bloc/settings_bloc.dart';
import '../settings_bloc/settings_event.dart';

class ColorButton extends StatefulWidget {
  String tag;
  Color color;

  ColorButton({
    super.key,
    required this.tag,
    required this.color,
  });

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FloatingActionButton(
        heroTag: widget.tag,
        mini: true,
        backgroundColor: widget.color,
        onPressed: () => BlocProvider.of<SettingsBloc>(context).add(
          SettingsChanged(
            Paint()
              ..color = widget.color
              ..blendMode = BlendMode.srcOver,
          ),
        ),
        child: Container(),
      ),
    );
  }
}
