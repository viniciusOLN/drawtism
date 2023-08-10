import 'package:flutter/material.dart';

class TextStyles {
  static double sizeDefault = 1;

  static TextStyle defaultStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: sizeDefault * 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    shadows: const <Shadow>[
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

  static TextStyle blueTextStyle = defaultStyle.copyWith(
    color: const Color.fromRGBO(54, 60, 204, 1),
    shadows: [],
  );

  static TextStyle whiteTextButtonStyle = defaultStyle.copyWith(
    fontSize: sizeDefault * 25,
  );

  static TextStyle blueTextButtonStyle = blueTextStyle.copyWith(
    fontSize: sizeDefault * 25,
    shadows: const [
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 8.0,
        color: Color.fromARGB(0, 0, 0, 0),
      ),
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 8.0,
        color: Color.fromARGB(0, 0, 0, 0),
      ),
    ],
  );
}
