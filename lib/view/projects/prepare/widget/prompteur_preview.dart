import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrompteurPreview extends StatelessWidget {
  const PrompteurPreview(this.text, {super.key, required this.fontSize});
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Get.theme.primaryTextTheme.headline2!.copyWith(
        wordSpacing: 4,
        letterSpacing: 4,
        fontFamily: 'Roboto',
        height: 1.3,
        fontSize: fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }
}
