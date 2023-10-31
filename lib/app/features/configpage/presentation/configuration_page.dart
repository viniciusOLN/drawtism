import 'package:drawtism/app/features/configpage/presentation/controllers/config_page_controller.dart';
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
  final controllerReferencea = Get.lazyPut(
    () => ConfigPageController(),
  );
  final controllerConfig = Get.find<ConfigPageController>();
  final controllerReference = Get.lazyPut(
    () => MusicController(),
  );
  final controller = Get.find<MusicController>();

  void setInitialAudioValue() async {
    controllerConfig.isPlaying = await controllerConfig.getAudio();
  }

  @override
  void initState() {
    if (!controller.isPlaying) {
      controllerConfig.titleButton = "Pausar Música";
    } else {
      controllerConfig.titleButton = "Tocar Música";
    }
    setState(() {
      controllerConfig.titleButton;
    });
    super.initState();
  }

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
                width: width * 0.70,
                children: [
                  SizedBox(height: width * 0.04),
                  CustomButton(
                    onPressed: () {
                      if (controllerConfig.isPlaying) {
                        controllerConfig.setAudio(false);
                        controller.playerThemeSong.pause();
                        controllerConfig.isPlaying = false;
                        setState(() {
                          controllerConfig.titleButton = "Tocar Música";
                          controllerConfig.isPlaying;
                        });
                      } else {
                        controllerConfig.setAudio(true);
                        if (controller.isPlaying) {
                          controller.playThemeSong();
                        } else {
                          controller.playerThemeSong.resume();
                        }
                        controllerConfig.isPlaying = true;
                        setState(() {
                          controllerConfig.titleButton = "Pausar Música";
                          controllerConfig.isPlaying;
                        });
                      }
                    },
                    title: controllerConfig.titleButton,
                    icon: controllerConfig.isPlaying
                        ? const Icon(
                            Icons.pause,
                            color: Colors.white,
                            size: 20,
                          )
                        : const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 20,
                          ),
                    style: TextStyles.whiteTextButtonStyle,
                    color: ColorStyle.buttonGreen,
                  ),
                  SizedBox(height: width * 0.04),
                  CustomButton(
                    onPressed: () {
                      Get.toNamed("/emailconfig");
                    },
                    title: "Configurar Nome",
                    style: TextStyles.whiteTextButtonStyle,
                    color: ColorStyle.buttonGreen,
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
