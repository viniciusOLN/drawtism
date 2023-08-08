import 'package:drawtism/app/global/utils/deviceUtils.dart';
import 'package:drawtism/app/global/widgets/customText.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  void Function() onPressed;
  final CustomText title;
  Color? color;
  Icon? icon;

  CustomButton({
    required this.onPressed,
    required this.title,
    required this.color,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.width(context);
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        shadowColor:
            MaterialStateProperty.all(const Color.fromARGB(73, 0, 0, 0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(color: Color.fromARGB(143, 0, 0, 0)),
          ),
        ),
      ),
      onPressed: () => onPressed(),
      child: Container(
        width: width * 0.5,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 10,
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
    );
  }
}
