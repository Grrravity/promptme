// ignore_for_file: avoid_dynamic_calls, avoid_slow_async_io

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:promptme/core/helper/toaster.dart';
import 'package:promptme/core/theme/theme_color.dart';
import 'package:promptme/domain/entities/projects.dart';
import 'package:promptme/infrastructure/services/yaml_mixin.dart';
import 'package:record/record.dart';
import 'package:string_extensions/string_extensions.dart';

class PrepareController extends GetxController
    with StateMixin<RxStatus>, YamlMixin {
  RxString dir = ''.obs;
  RxList<ProjectsSnapshot> projects = <ProjectsSnapshot>[].obs;
  late ProjectsSnapshot yamlFile;
  RxList<String> prompteur = <String>[].obs;
  RxInt wordCount = 0.obs;
  String yamlName = '';
  RxDouble fontSize = 60.0.obs;
  RxInt wordPerMin = 75.obs;
  RxDouble mins = 0.0.obs;
  Duration duration = Duration.zero;
  RxInt extracts = 0.obs;
  ScrollController scrollController = ScrollController();
  RxBool isScrollOngoing = false.obs;
  RxBool isRecording = false.obs;
  RxBool isPauseRecording = false.obs;
  RxBool isEditEnabled = false.obs;

  final recorder = Record();

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
        getYaml();
        countInput();
        getPrompt();
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

  void getYaml() {
    getYamlElement(projects).fold((yamlElement) => yamlFile = yamlElement,
        (error) {
      showToast(
        backgroundColog: black,
        isSuccess: false,
        message: kDebugMode ? error.toString() : error.message,
        action: SnackBarAction(label: 'recharger', onPressed: onInit),
      );
      throw error;
    });
  }

  void countInput() {
    countYamlInput(yamlFile).fold((count) => extracts.value = count, (error) {
      showToast(
        backgroundColog: black,
        isSuccess: false,
        message: kDebugMode ? error.toString() : error.message,
        action: SnackBarAction(label: 'recharger', onPressed: onInit),
      );
      throw error;
    });
  }

  void getPrompt() {
    getYamlPromptText(yamlFile).fold((sections) {
      for (final d in sections.nodes) {
        final content = d.value['text'] as String?;
        if (content != null) {
          prompteur.add(content);
        }
      }
      if (prompteur.isEmpty) {
        showToast(
          backgroundColog: black,
          isSuccess: false,
          message: 'Le fichier yaml semble ne contenir aucun text',
          action: SnackBarAction(label: 'recharger', onPressed: onInit),
        );
      }
    }, (error) {
      showToast(
        backgroundColog: black,
        isSuccess: false,
        message: kDebugMode ? error.toString() : error.message,
        action: SnackBarAction(label: 'recharger', onPressed: onInit),
      );
      throw error;
    });
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
          showToast(
            backgroundColog: black,
            isSuccess: false,
            message: kDebugMode
                ? e.toString()
                : "Une erreur inatendue s'est produite. Merci de déposer une issue sur le repo github de promptme.",
            action: SnackBarAction(label: 'recharger', onPressed: onInit),
          );
        }
      }
    }
    return list;
  }

  String getTextToDisplay(int index) {
    return getListWithWordLimit(
      content: prompteur[index],
    ).join('\n');
  }

  void toggleEdition() {
    if (!isScrollOngoing.value) {
      isEditEnabled.toggle();
    }
  }

  Future<void> updateSlideContent(int index, String text) async {
    await updateYamlContent(yamlFile, text, index).then(
      (value) => value.fold((sections) {
        prompteur.value = [];
      }, (error) {
        showToast(
          backgroundColog: black,
          isSuccess: false,
          message: kDebugMode ? error.toString() : error.message,
          action: SnackBarAction(label: 'recharger', onPressed: onInit),
        );
        throw error;
      }),
    );
    getPrompt();
    countWordInText();
    Get.back();
    toggleEdition();
  }

  void incrementFontSize() {
    if (!isScrollOngoing.value) {
      fontSize.value++;
    }
  }

  void decrementFontSize() {
    if (!isScrollOngoing.value) {
      fontSize.value--;
    }
  }

  void incrementWordPerMin() {
    if (!isScrollOngoing.value) {
      wordPerMin.value++;
      calcDuration();
    }
  }

  void decrementWordPerMin() {
    if (!isScrollOngoing.value) {
      wordPerMin.value--;
      calcDuration();
    }
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
      playScroll();
    }
  }

  void playScroll() {
    isEditEnabled.value = false;
    isScrollOngoing.value = true;
    final percent = scrollController.position.pixels /
        scrollController.position.maxScrollExtent;
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.linear,
      duration: duration - (duration * percent),
    );
  }

  void pauseScroll() {
    isScrollOngoing.value = false;
    scrollController.jumpTo(scrollController.position.pixels);
  }

  void scrollToStart() {
    if (!isScrollOngoing.value) {
      scrollController.animateTo(
        scrollController.position.minScrollExtent,
        curve: Curves.linear,
        duration: const Duration(milliseconds: 250),
      );
    }
  }

  void scrollListener() {
    if (scrollController.hasClients &&
        scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
      isScrollOngoing.value = false;
    }
  }

  Future<void> record() async {
    // Check and request permission
    if (await recorder.hasPermission() && !(await recorder.isRecording())) {
      isRecording.value = true;
      isPauseRecording.value = false;
      // Start recording
      final date =
          DateFormat('yyyy-MM-dd_HH-mm-ss-SSSS').format(DateTime.now());
      await recorder.start(
        path: projects.first.entity.path.replaceAllMapped(
          projects.first.name,
          (match) => 'promptme_rec_$date.m4a',
        ),
        numChannels: 1,
      );
    }
  }

  Future<void> stopRecord() async {
    if (await recorder.isRecording()) {
      isRecording.value = false;
      isPauseRecording.value = false;
      await recorder.stop();
    }
  }

  Future<void> playPause() async {
    if (isPauseRecording.value) {
      await unPauseRecord();
    } else {
      await pauseRecord();
    }
  }

  Future<void> pauseRecord() async {
    if (isRecording.value) {
      isPauseRecording.value = true;
      await recorder.pause();
    }
  }

  Future<void> unPauseRecord() async {
    if (isRecording.value) {
      isPauseRecording.value = false;
      await recorder.resume();
    }
  }

  void retry() {
    onInit();
  }
}
