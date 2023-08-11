import 'package:drawtism/app/features/choosepage/presentation/choosepage.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawpage.dart';
import 'package:drawtism/app/features/homepage/presentation/homepage.dart';
import 'package:drawtism/app/features/levelpage/presentation/levelpage.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const Homepage(),
  '/drawpage': (context) => const DrawPage(),
  '/mode': (context) => const ChooseMode(),
  '/level': (context) => const LevelPage(),
};
