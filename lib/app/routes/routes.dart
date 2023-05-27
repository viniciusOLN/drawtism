import 'package:drawtism/app/features/homepage/presentation/homepage.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const Homepage(),
};
