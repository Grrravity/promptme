import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:promptme/core/Helper/constants.dart';
import 'package:promptme/core/Theme/theme_color.dart';

class XEmptyWidget extends StatelessWidget {
  const XEmptyWidget({
    super.key,
    required this.message,
    this.title,
    this.asset,
    this.hasFAB = false,
  });
  final String? title;
  final String message;
  final String? asset;
  final bool hasFAB;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: SvgPicture.asset(
                asset ?? svgEmptyFile,
                placeholderBuilder: (BuildContext context) => const SizedBox(
                  height: 125,
                ),
              ),
            ),
            RichText(
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "${title ?? "Oups !"}\r\n\r\n",
                    style: Get.textTheme.bodyText1!.copyWith(
                      color: Get.theme.errorColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: message,
                    style: Get.textTheme.bodyText2!.copyWith(color: grey5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
