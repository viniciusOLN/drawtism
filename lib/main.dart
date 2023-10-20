import 'package:audioplayers/audioplayers.dart';
import 'package:drawtism/app/routes/routes.dart';
import 'package:drawtism/music_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final controllerReference = Get.lazyPut(
    () => MusicController(),
  );
  final controller = Get.find<MusicController>();

  void checkAudioIsPlaying() async {
    final prefs = await SharedPreferences.getInstance();
    bool isPlaying = prefs.getBool("music") ?? true;
    if (isPlaying) {
      controller.playThemeSong();
      controller.isPlaying = false;
    } else {
      controller.isPlaying = true;
    }
  }

  @override
  void initState() {
    checkAudioIsPlaying();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {
      controller.playerThemeSong.pause();
    } else if (state == AppLifecycleState.resumed) {
      final prefs = await SharedPreferences.getInstance();
      bool isPlaying = prefs.getBool("music") ?? true;
      if (isPlaying) {
        controller.playerThemeSong.resume();
      }
    } else if (state == AppLifecycleState.detached) {
      controller.playerThemeSong.resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DrawTism',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
