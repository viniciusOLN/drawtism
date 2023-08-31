import 'package:flutter/material.dart';

import '../../../global/utils/colors.dart';
import '../../../global/utils/deviceUtils.dart';
import '../../../global/utils/text_styles.dart';
import '../../../global/widgets/background.dart';
import '../../../global/widgets/customText.dart';
import '../../../global/widgets/default_button.dart';
import '../../../global/widgets/default_container.dart';
import 'widgets/custom_icon.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.width(context);

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
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
      ),
    );
  }
}
