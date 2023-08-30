import 'package:flutter/material.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class SettingsChanged extends SettingsEvent {
  Paint paint;
  SettingsChanged(this.paint);
}

class SettingsStrokeWidthChanged extends SettingsEvent {
  final double strokeWidth;
  const SettingsStrokeWidthChanged(this.strokeWidth);
}
