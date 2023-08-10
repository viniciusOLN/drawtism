import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  double? width;
  List<Widget> children;
  CustomContainer({
    this.width,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [...children],
      ),
    );
  }
}
