import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrompteurPreview extends StatelessWidget {
  const PrompteurPreview(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Get.theme.primaryTextTheme.headline5!.copyWith(
          wordSpacing: 4, letterSpacing: 4, fontFamily: 'Roboto', height: 1.3),
    );
  }
}
