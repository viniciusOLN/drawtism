import 'package:drawtism/app/features/homepage/presentation/widgets/custom_icon.dart';
import 'package:drawtism/app/global/utils/colors.dart';
import 'package:drawtism/app/global/utils/deviceUtils.dart';
import 'package:drawtism/app/global/utils/text_styles.dart';
import 'package:drawtism/app/global/widgets/background.dart';
import 'package:drawtism/app/global/widgets/customText.dart';
import 'package:drawtism/app/global/widgets/default_button.dart';
import 'package:drawtism/app/global/widgets/default_container.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.width(context);

    return Scaffold(
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: width * 0.090),
            Image.asset("assets/images/logo.png"),
            SizedBox(height: width * 0.030),
            CustomText(
              text: "Aquarela Autista",
              style: TextStyles.defaultStyle,
            ),
            SizedBox(height: width * 0.15),
            CustomContainer(
              width: width * 0.65,
              children: [
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/mode');
                  },
                  title: 'JOGAR',
                  style: TextStyles.whiteTextButtonStyle,
                  color: ColorStyle.buttonBlue,
                  icon: CustomIcon(),
                ),
                SizedBox(height: width * 0.04),
                CustomButton(
                  onPressed: () {},
                  title: 'Configurações',
                  style: TextStyles.blueTextButtonStyle,
                  color: ColorStyle.buttonWhite,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
