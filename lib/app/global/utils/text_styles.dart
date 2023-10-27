import 'package:flutter/material.dart';

class TextStyles {
  static double sizeDefault = 1;

  static TextStyle defaultStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: sizeDefault * 26,
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
    color: Color.fromRGBO(81, 175, 247, 1),
    shadows: [],
  );

  static TextStyle whiteTextButtonStyle = defaultStyle.copyWith(
    fontSize: sizeDefault * 22,
  );

  static TextStyle blueTextButtonStyle = blueTextStyle.copyWith(
    fontSize: sizeDefault * 22,
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
    // color: Color.fromRGBO(81, 175, 247, 1),
  );

  static TextStyle blueTextGeneric = blueTextStyle.copyWith(
    fontSize: sizeDefault * 18,
  );

  static TextStyle blackTextGeneric = blueTextGeneric.copyWith(
    fontSize: sizeDefault * 20,
    // color: const Color.fromARGB(255, 49, 49, 49),
    color: const Color.fromRGBO(120, 157, 99, 1),
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
