import 'package:drawtism/app/global/utils/deviceUtils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  void Function() onPressed;
  final String title;
  final TextStyle? style;
  final String? imageUrl;
  Color? color;
  Icon? icon;
  double? widthButton;

  CustomButton({
    required this.onPressed,
    required this.title,
    required this.color,
    this.icon,
    this.widthButton,
    this.style,
    this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.width(context);
    return ElevatedButton(
      style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: MaterialStateProperty.all(color),
        shadowColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(
              color: Color.fromARGB(250, 0, 0, 0),
              width: 1.2,
            ),
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
            imageUrl != null
                ? Image.asset(
                    imageUrl ?? '',
                    width: (width * 0.12),
                    height: (width * 0.12),
                  )
                : Container(),
            icon ?? Container(),
            const Padding(padding: EdgeInsets.all(10)),
            Text(title, style: style),
          ],
        ),
      ),
    );
  }
}
