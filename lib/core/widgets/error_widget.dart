import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:promptme/core/widgets/button_factory.dart';

class CustomErrorwidget extends StatelessWidget {
  const CustomErrorwidget({
    super.key,
    required this.error,
    required this.onRetry,
  });
  final String error;
  final void Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Icon(
                LineAwesomeIcons.heart_broken,
                size: 100,
              ),
            ),
            RichText(
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Oops, une erreur est survenue\r\n\r\n',
                    style: Get.textTheme.headline6,
                  ),
                  TextSpan(
                    text: error,
                    //style du deuxieme élément
                    style: Get.textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 56,
              child: ButtonFactory.redFilled(
                value: 'Réessayer'.toUpperCase(),
                onPressed: onRetry,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
