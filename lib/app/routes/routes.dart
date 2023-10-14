import 'package:drawtism/app/features/choosepage/presentation/choosepage.dart';
import 'package:drawtism/app/features/configpage/presentation/configuration_page.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawing_bloc/drawing_bloc.dart';
import 'package:drawtism/app/features/drawpage/presentation/drawpage.dart';
import 'package:drawtism/app/features/drawpage/presentation/settings_bloc/settings_bloc.dart';
import 'package:drawtism/app/features/emailconfigpage/presentation/email_config.dart';
import 'package:drawtism/app/features/homepage/presentation/homepage.dart';
import 'package:drawtism/app/features/levelpage/presentation/levelpage.dart';
import 'package:drawtism/app/features/photopage/presentation/photopage.dart';
import 'package:drawtism/app/features/resultpage/presentation/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => Homepage(),
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
      child: DrawPage(),
    );
  },
  '/mode': (context) => const ChooseMode(),
  '/level': (context) => const LevelPage(),
  '/result': (context) => ResultPage(),
  '/photo': (context) => const PhotoPage(),
  '/config': (context) => const ConfigurationPage(),
  '/emailconfig': (context) => ConfigEmailPage(),
};
