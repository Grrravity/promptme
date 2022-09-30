import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promptme/core/theme/theme_color.dart';

class Settings extends StatefulWidget {
  const Settings({
    super.key,
    required this.wordCount,
    required this.fileName,
    required this.incrementFontSize,
    required this.decrementFontSize,
    required this.incrementWordPerMin,
    required this.decrementWordPerMin,
    required this.wordPerMin,
    required this.fontSize,
    required this.estimatedDuration,
  });
  final int wordCount;
  final String fileName;
  final int wordPerMin;
  final double fontSize;
  final Duration estimatedDuration;
  final void Function() incrementFontSize;
  final void Function() decrementFontSize;
  final void Function() incrementWordPerMin;
  final void Function() decrementWordPerMin;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.fileName,
              style: Get.textTheme.button!.copyWith(color: grey6),
            ),
            Row(
              children: [
                Tooltip(
                  message: 'Raccourci : flèche de gauche',
                  child: IconButton(
                    splashRadius: 18,
                    onPressed: widget.decrementWordPerMin,
                    icon: const Icon(Icons.remove),
                    color: orangeChart,
                  ),
                ),
                Text(
                  'Mot par min : ${widget.wordPerMin}',
                  style: Get.textTheme.headline6,
                ),
                Tooltip(
                  message: 'Raccourci : flèche de droite',
                  child: IconButton(
                    splashRadius: 18,
                    onPressed: widget.incrementWordPerMin,
                    icon: const Icon(Icons.add),
                    color: green,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Tooltip(
                  message: 'Raccourci : flèche du bas',
                  child: IconButton(
                    splashRadius: 18,
                    icon: const Icon(Icons.remove),
                    onPressed: widget.decrementFontSize,
                    color: orangeChart,
                  ),
                ),
                Text(
                  'Taille du texte : ${widget.fontSize}',
                  style: Get.textTheme.headline6,
                ),
                Tooltip(
                  message: 'Raccourci : flèche du haut',
                  child: IconButton(
                    splashRadius: 18,
                    icon: const Icon(Icons.add),
                    color: green,
                    onPressed: widget.incrementFontSize,
                  ),
                ),
              ],
            ),
            Text(
              'Temps estimé (h:m:s) : ${widget.estimatedDuration.toString().split('.').first}',
              style: Get.textTheme.bodyText1!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'Nombre de mots : ${widget.wordCount}',
              style: Get.textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
