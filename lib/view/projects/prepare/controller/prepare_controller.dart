// ignore_for_file: avoid_dynamic_calls, avoid_slow_async_io

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:promptme/domain/entities/projects.dart';
import 'package:string_extensions/string_extensions.dart';
import 'package:yaml/yaml.dart';

class PrepareController extends GetxController with StateMixin<RxStatus> {
  RxString dir = ''.obs;
  RxList<ProjectsSnapshot> projects = <ProjectsSnapshot>[].obs;
  RxList<String> prompteur = <String>[].obs;
  RxInt wordCount = 0.obs;
  String yamlName = '';
  RxDouble fontSize = 60.0.obs;
  RxInt wordPerMin = 80.obs;
  RxDouble mins = 0.0.obs;
  Duration duration = Duration.zero;
  RxInt extracts = 0.obs;
  ScrollController scrollController = ScrollController();
  RxBool isScrollOngoing = false.obs;

  bool shouldAutoscroll = false;

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    try {
      final path = Get.arguments['path'] as String;
      final directory = Directory(path);
      final exist = await directory.exists();
      if (exist) {
        dir.value = path;
        projects.value = await getContent(directory);
        extracts.value = countInput(projects);
        await getPrompt();
        countWordInText();
      }
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
    super.onReady();
  }

  Future<List<ProjectsSnapshot>> getContent(
    Directory directory, {
    bool recursive = true,
  }) async {
    final subFolders = <FileSystemEntity>[];
    directory.listSync().forEach(
          (element) async => subFolders.add(element),
        );
    subFolders
      ..sort((a, b) => basename(b.path).compareTo(basename(a.path)))
      ..removeWhere((element) => basename(element.path).startsWith('.'));
    return Future.value(
      subFolders
          .asMap()
          .entries
          .map((e) => ProjectsSnapshot.fromFileEntity(e.value))
          .toList(),
    );
  }

  int countInput(List<ProjectsSnapshot> content) {
    var count = 0;
    if (content.any((element) => element.name.endsWith('.yaml'))) {
      try {
        final yamlElement =
            content.firstWhere((element) => element.name.endsWith('.yaml'));

        final file = File(yamlElement.entity.path);
        final yamlString = file.readAsStringSync();

        final yamlDoc = loadYamlDocument(yamlString);
        final yamlContent = yamlDoc.contents;
        final yaml = yamlContent.value as YamlMap;

        final yamlList = yaml['sections'] as YamlList;
        count = yamlList.length;
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return count;
  }

  Future<void> getPrompt() async {
    if (projects.any((element) => element.name.endsWith('.yaml'))) {
      try {
        final yamlElement =
            projects.firstWhere((element) => element.name.endsWith('.yaml'));
        yamlName = yamlElement.name;

        final file = File(yamlElement.entity.path);
        final yamlString = await file.readAsString();

        final yamlDoc = loadYamlDocument(yamlString);
        final yamlContent = yamlDoc.contents;
        final yaml = yamlContent.value as YamlMap;

        final sections = yaml['sections'] as YamlList;
        for (final d in sections.nodes) {
          final content = d.value['text'] as String;
          prompteur.add(content);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  List<String> getListWithWordLimit({
    required String content,
    int stepper = 5,
  }) {
    final list = <String>[];

    final contentFormatted = content.split(' ');
    if (int.tryParse((contentFormatted.length / stepper).toString()) != null) {
      for (var i = 0; i < contentFormatted.length; i += stepper) {
        list.add(contentFormatted.getRange(i, i + stepper).join(' '));
      }
    } else {
      var inc = 0;
      try {
        for (inc = 0; inc < contentFormatted.length; inc += stepper) {
          list.add(
            contentFormatted.getRange(inc, inc + stepper).join(' '),
          );
        }
      } catch (e) {
        if (e is RangeError) {
          list.add(
            contentFormatted
                .getRange(
                  inc,
                  contentFormatted.length,
                )
                .join(' '),
          );
        } else {
          debugPrint(e.toString());
        }
      }
    }
    return list;
  }

  void incrementFontSize() {
    fontSize.value++;
  }

  void decrementFontSize() {
    fontSize.value--;
  }

  void incrementWordPerMin() {
    wordPerMin.value++;
    calcDuration();
  }

  void decrementWordPerMin() {
    wordPerMin.value--;
    calcDuration();
  }

  void countWordInText() {
    final text = prompteur.join();
    wordCount.value = text.countWords;
    calcDuration();
  }

  void calcDuration() {
    mins.value = (wordCount.value / wordPerMin.value).toPrecision(2);
    duration = Duration(seconds: (mins.value * 60).toInt());
  }

  void toggleScroll() {
    if (isScrollOngoing.value) {
      pauseScroll();
    } else {
      scrollDown();
    }
  }

  void scrollDown() {
    isScrollOngoing.value = true;
    final percent = scrollController.position.pixels /
        scrollController.position.maxScrollExtent;
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.linear,
      duration: duration - (duration * percent),
    );
  }

  void scrollListener() {
    if (scrollController.hasClients &&
        scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
      isScrollOngoing.value = false;
    }
  }

  void pauseScroll() {
    isScrollOngoing.value = false;
    scrollController.jumpTo(scrollController.position.pixels);
  }

  void retry() {
    onInit();
  }
}
