import 'package:flutter/material.dart';

abstract class SettingsState {
  const SettingsState(this.paintSettings);
  final Paint paintSettings;
}

class SettingsInitial extends SettingsState {
  const SettingsInitial(Paint paintSettings) : super(paintSettings);
}

class SettingsLoading extends SettingsState {
  const SettingsLoading(Paint paintSettings) : super(paintSettings);
}

class SettingsLoaded extends SettingsState {
  const SettingsLoaded(Paint paintSettings) : super(paintSettings);
}
