import 'package:drawtism/app/features/homepage/presentation/homepage.dart';
import 'package:drawtism/app/global/utils/colors.dart';
import 'package:drawtism/app/global/widgets/default_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../global/utils/deviceUtils.dart';
import '../../../global/utils/text_styles.dart';
import '../../../global/widgets/background.dart';
import '../../../global/widgets/customText.dart';
import '../../../global/widgets/default_button.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  void redirectPage(String route) async {
    final prefs = await SharedPreferences.getInstance();

    String username = prefs.getString("username") ?? "";
    String email = prefs.getString("email") ?? "";

    if (username == "" || email == "") {
      Get.toNamed("/emailconfig");
    } else {
      Get.toNamed(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.width(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Voltar'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          color: Theme.of(context).iconTheme.color,
          onPressed: () {
            Get.to(() => Homepage());
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
                  text: "Escolha um modo", style: TextStyles.defaultStyle),
              SizedBox(height: width * 0.05),
              CustomContainer(
                width: width * 0.81,
                children: [
                  CustomButton(
                    onPressed: () {
                      redirectPage("/level");
                    },
                    title: 'Completar Formas',
                    style: TextStyles.blueTextButtonStyle,
                    color: ColorStyle.buttonWhite,
                    imageUrl: 'assets/images/icons/shapes.png',
                  ),
                  SizedBox(height: width * 0.04),
                  CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/level');
                    },
                    title: 'Completar Frases',
                    style: TextStyles.blueTextButtonStyle,
                    color: ColorStyle.buttonWhite,
                    imageUrl: 'assets/images/icons/letters.png',
                  ),
                  SizedBox(height: width * 0.05),
                  CustomText(
                    text: "ou",
                    style: TextStyles.defaultStyle,
                  ),
                  SizedBox(height: width * 0.05),
                  CustomButton(
                    onPressed: () {
                      redirectPage("/photo");
                    },
                    title: 'Tirar Foto',
                    style: TextStyles.blueTextButtonStyle,
                    color: ColorStyle.buttonWhite,
                    imageUrl: 'assets/images/icons/cam.png',
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
