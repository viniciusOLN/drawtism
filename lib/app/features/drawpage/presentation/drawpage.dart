import 'package:drawtism/app/features/drawpage/presentation/canvaspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawPage extends StatelessWidget {
  const DrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersive,
    );

    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: const Column(
        children: [
          CanvasPage(),
        ],
      ),
    );
  }
}
