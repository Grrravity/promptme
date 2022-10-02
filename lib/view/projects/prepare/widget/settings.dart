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
    required this.isEditionEnabled,
    required this.toggleEdition,
    required this.isScrolling,
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
  final bool isEditionEnabled;
  final void Function() toggleEdition;
  final bool isScrolling;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.isScrolling
          ? grey4
          : widget.isEditionEnabled
              ? paleRedChart
              : white,
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
                    icon: const Icon(Icons.remove_rounded),
                    color: orangeChart,
                  ),
                ),
                Text(
                  'Mots par min : ${widget.wordPerMin}',
                  style: Get.textTheme.headline6,
                ),
                Tooltip(
                  message: 'Raccourci : flèche de droite',
                  child: IconButton(
                    splashRadius: 18,
                    onPressed: widget.incrementWordPerMin,
                    icon: const Icon(Icons.add_rounded),
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
                    icon: const Icon(Icons.remove_rounded),
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
                    icon: const Icon(Icons.add_rounded),
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
            Tooltip(
              message: 'Raccourci : touche "E"',
              child: IconButton(
                onPressed: widget.toggleEdition,
                splashRadius: 18,
                icon: Icon(
                  !widget.isEditionEnabled
                      ? Icons.mode_edit_rounded
                      : Icons.edit_off_rounded,
                  color: !widget.isEditionEnabled ? green : primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
