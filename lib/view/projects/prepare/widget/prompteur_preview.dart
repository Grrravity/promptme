import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promptme/core/widgets/x_button.dart';

class PrompteurPreview extends StatelessWidget {
  const PrompteurPreview(
    this.text, {
    super.key,
    required this.fontSize,
    required this.isEditionEnabled,
    required this.onSave,
  });
  final String text;
  final double fontSize;
  final bool isEditionEnabled;
  final Future<void> Function(String text) onSave;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEditionEnabled ? () => Get.dialog(editionDialog()) : null,
      child: Text(
        text,
        style: Get.theme.primaryTextTheme.headline2!.copyWith(
          wordSpacing: 4,
          letterSpacing: 4,
          fontFamily: 'Roboto',
          height: 1.3,
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget editionDialog() {
    final controller = TextEditingController(
      text: text.replaceAllMapped('\n', (match) => ' ').trimRight(),
    );
    return Dialog(
      child: SizedBox(
        height: Get.height * 0.8,
        width: Get.width * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  maxLines: null,
                  expands: true,
                  controller: controller,
                  style: Get.textTheme.bodyText1!.copyWith(
                    fontSize: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    XButton.noBorderGrey(
                      value: 'Annuler',
                      fontSize: 16,
                      onPressed: () => Get.back(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    XButton.noBorderRed(
                      value: 'Enregistrer',
                      fontSize: 16,
                      onPressed: () async {
                        await onSave(
                          controller.text.endsWith('\n')
                              ? controller.text
                              : '${controller.text}\n',
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
