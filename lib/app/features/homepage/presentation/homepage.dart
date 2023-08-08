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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
