import 'package:drawtism/app/global/utils/colors.dart';
import 'package:drawtism/app/global/widgets/default_container.dart';
import 'package:flutter/material.dart';

import '../../../global/utils/deviceUtils.dart';
import '../../../global/utils/text_styles.dart';
import '../../../global/widgets/background.dart';
import '../../../global/widgets/customText.dart';
import '../../../global/widgets/default_button.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> levels = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];
    double width = DeviceUtils.width(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Voltar'),
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
                text: "Escolha um nível",
                style: TextStyles.defaultStyle,
              ),
              SizedBox(height: width * 0.06),
              CustomContainer(
                width: width * 0.76,
                children: List.generate(levels.length, (index) {
                  index = index + 1;
                  return Column(
                    children: [
                      CustomButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/drawpage');
                        },
                        title: 'nível $index',
                        style: TextStyles.blueTextButtonStyle,
                        color: ColorStyle.buttonWhite,
                        imageUrl: 'assets/images/icons/blue_star.png',
                      ),
                      SizedBox(height: width * 0.02),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
