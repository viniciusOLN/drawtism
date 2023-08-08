import 'package:drawtism/app/global/utils/deviceUtils.dart';
import 'package:drawtism/app/global/widgets/customText.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  void Function() onPressed;
  final CustomText title;
  Color? color;
  Icon? icon;
  double? widthButton;

  CustomButton({
    required this.onPressed,
    required this.title,
    required this.color,
    this.icon,
    this.widthButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.width(context);
    return Container(
      width: widthButton ?? 200,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shadowColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: const BorderSide(color: Color.fromARGB(250, 0, 0, 0)),
            ),
          ),
        ),
        onPressed: () => onPressed(),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? Container(),
              const Padding(padding: EdgeInsets.all(10)),
              title,
            ],
          ),
        ),
      ),
    );
  }
}
