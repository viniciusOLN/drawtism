import 'package:drawtism/app/global/utils/colors.dart';
import 'package:drawtism/app/global/widgets/default_container.dart';
import 'package:flutter/material.dart';

import '../../../global/utils/deviceUtils.dart';
import '../../../global/utils/text_styles.dart';
import '../../../global/widgets/background.dart';
import '../../../global/widgets/customText.dart';
import '../../../global/widgets/default_button.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.width(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Voltar'),
      ),
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: width * 0.090),
            Image.asset("assets/images/logo.png"),
            SizedBox(height: width * 0.030),
            CustomText(text: "Escolha um modo", style: TextStyles.defaultStyle),
            SizedBox(height: width * 0.05),
            CustomContainer(
              width: width * 0.81,
              children: [
                CustomButton(
                  onPressed: () {},
                  title: 'Completar Formas',
                  style: TextStyles.blueTextButtonStyle,
                  color: ColorStyle.buttonWhite,
                  imageUrl: 'assets/images/icons/shapes.png',
                ),
                SizedBox(height: width * 0.04),
                CustomButton(
                  onPressed: () {},
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
                  onPressed: () {},
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
    );
  }
}
