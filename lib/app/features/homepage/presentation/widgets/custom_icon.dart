import 'package:flutter/material.dart';

Icon CustomIcon() {
  return const Icon(
    Icons.play_arrow,
    size: 40.2,
    color: Colors.white,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 8.0,
        color: Color.fromARGB(100, 0, 0, 0),
      ),
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 8.0,
        color: Color.fromARGB(100, 0, 0, 0),
      ),
    ],
  );
}
