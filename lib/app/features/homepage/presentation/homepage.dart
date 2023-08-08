import 'package:drawtism/app/global/utils/deviceUtils.dart';
import 'package:drawtism/app/global/utils/textStyles.dart';
import 'package:drawtism/app/global/widgets/background.dart';
import 'package:drawtism/app/global/widgets/customText.dart';
import 'package:drawtism/app/global/widgets/default_button.dart';
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
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, '/drawpage');
              },
              title: CustomText(text: 'JOGAR', style: TextStyles.defaultStyle),
              color: const Color.fromRGBO(54, 60, 204, 1),
              icon: const Icon(
                Icons.play_arrow,
                size: 40.2,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 8.0,
                    color: Color.fromARGB(100, 0, 0, 0),
                  ),
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 8.0,
                    color: Color.fromARGB(100, 0, 0, 0),
                  ),
                ],
              ),
              widthButton: width * 0.70,
            ),
            SizedBox(height: width * 0.04),
            CustomButton(
              onPressed: () {},
              title: CustomText(
                text: 'Configurações',
                style: TextStyles.blueTextStyle,
              ),
              color: const Color.fromARGB(255, 255, 255, 255),
              widthButton: width * 0.70,
            ),
          ],
        ),
      ),
    );
  }
}
