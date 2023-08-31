import 'package:drawtism/app/features/choosepage/presentation/choosepage.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawing_bloc/drawing_bloc.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawpage.dart';
import 'package:drawtism/app/features/drawpage/presentation/settings_bloc/settings_bloc.dart';
import 'package:drawtism/app/features/homepage/presentation/homepage.dart';
import 'package:drawtism/app/features/levelpage/presentation/levelpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const Homepage(),
  '/drawpage': (context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DrawingBloc>(
          create: (_) => DrawingBloc(),
        ),
        BlocProvider<SettingsBloc>(
          create: (_) => SettingsBloc(),
        ),
      ],
      child: const DrawPage(),
    );
  },
  '/mode': (context) => const ChooseMode(),
  '/level': (context) => const LevelPage(),
};
