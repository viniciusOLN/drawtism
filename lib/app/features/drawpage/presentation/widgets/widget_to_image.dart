import 'package:flutter/material.dart';

class WidgetToImage extends StatefulWidget {
  final Function(GlobalKey key) builder;
  const WidgetToImage({super.key, required this.builder});

  @override
  State<WidgetToImage> createState() => _WidgetToImageState();
}

class _WidgetToImageState extends State<WidgetToImage> {
  final globalkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: RepaintBoundary(
        key: globalkey,
        child: widget.builder(globalkey),
      ),
    );
  }
}
