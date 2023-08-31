import 'package:flutter/material.dart';

import 'widgets/paint_module.dart';

class DrawPage extends StatelessWidget {
  const DrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Voltar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Cubra as linhas e complete o desenho!"),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset("assets/images/challenges/challenge_1_1.png"),
              PaintModule(),
            ],
          ),
        ],
      ),
    );
  }
}
