import 'package:drawtism/app/features/homepage/presentation/homepage.dart';
import 'package:drawtism/app/global/utils/colors.dart';
import 'package:drawtism/app/global/utils/deviceUtils.dart';
import 'package:drawtism/app/global/utils/text_styles.dart';
import 'package:drawtism/app/global/widgets/background.dart';
import 'package:drawtism/app/global/widgets/customText.dart';
import 'package:drawtism/app/global/widgets/default_button.dart';
import 'package:drawtism/app/global/widgets/default_container.dart';
import 'package:drawtism/music_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  bool isPlayMusic = false;
  String titleButton = "Pausar Música";

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.width(context);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Voltar'),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          color: Theme.of(context).iconTheme.color,
          onPressed: () {
            Get.to(() => const Homepage());
          },
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: width * 0.090),
              Image.asset("assets/images/logo.png"),
              SizedBox(height: width * 0.030),
              CustomText(
                text: "Configurações",
                style: TextStyles.defaultStyle,
              ),
              SizedBox(height: width * 0.15),
              CustomContainer(
                width: width * 0.65,
                children: [
                  SizedBox(height: width * 0.04),
                  CustomButton(
                    onPressed: () {
                      final controllerReference = Get.lazyPut(
                        () => MusicController(),
                      );
                      final controller = Get.find<MusicController>();
                      if (!isPlayMusic) {
                        controller.playerThemeSong.pause();
                        isPlayMusic = true;
                        setState(() {
                          titleButton = "Tocar Música";
                        });
                      } else {
                        controller.playerThemeSong.resume();
                        isPlayMusic = false;
                        setState(() {
                          titleButton = "Pausar Música";
                        });
                      }
                    },
                    title: titleButton,
                    icon: !isPlayMusic
                        ? const Icon(
                            Icons.pause,
                            color: Colors.red,
                            size: 30,
                          )
                        : const Icon(
                            Icons.play_arrow,
                            color: Colors.red,
                            size: 30,
                          ),
                    style: TextStyles.blueTextButtonStyle,
                    color: ColorStyle.buttonWhite,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
