import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global/utils/generate_key.dart';
import '../settings_bloc/settings_bloc.dart';
import '../settings_bloc/settings_event.dart';

class ColorButton extends StatefulWidget {
  Color color;

  ColorButton({
    super.key,
    required this.color,
  });

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  @override
  Widget build(BuildContext context) {
    String key = getRandomString(5);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FloatingActionButton(
        key: Key(key),
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
