// ignore_for_file: avoid_slow_async_io

import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:promptme/core/routes/route.dart';
import 'package:promptme/domain/entities/projects.dart';
import 'package:yaml/yaml.dart';

class ProjectsController extends GetxController with StateMixin<RxStatus> {
  RxList<ProjectsSnapshot> projects = <ProjectsSnapshot>[].obs;
  RxString workingDirPath = ''.obs;

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    if (workingDirPath.value != '') {
      await getProjectList();
    }
    change(null, status: RxStatus.success());
    super.onReady();
  }

  void startProject(String path) {
    // ignore: inference_failure_on_function_invocation
    Get.toNamed(Routes.projects + Routes.prepare, arguments: {'path': path});
  }

  void retry() {
    onInit();
  }

  Future<void> findDirectory(BuildContext context) async {
    workingDirPath.value = await showDialog(context) ?? '';
    unawaited(getProjectList());
  }

  Future<String?> showDialog(BuildContext context) async {
    final path = await FilePicker.platform.getDirectoryPath();

    return path;
  }

  Future<void> getProjectList() async {
    change(null, status: RxStatus.loading());
    if (workingDirPath.value != '') {
      final directory = Directory(workingDirPath.value);
      final exist = await directory.exists();
      if (exist) {
        projects.value = await getContent(directory);
      }
    }
    change(null, status: RxStatus.success());
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
    return recursive
        ? filterContent(subFolders)
        : Future.value(
            subFolders
                .asMap()
                .entries
                .map((e) => ProjectsSnapshot.fromFileEntity(e.value))
                .toList(),
          );
  }

  Future<List<ProjectsSnapshot>> filterContent(
    List<FileSystemEntity> subFolders,
  ) async {
    final finalList = <ProjectsSnapshot>[];
    await Future.forEach(subFolders, (folder) async {
      final directory = Directory(folder.path);

      final exist = await directory.exists();
      if (exist) {
        final content = await getContent(directory, recursive: false);

        finalList.add(
          ProjectsSnapshot.fromFileEntity(folder).copyWith(
            hasYaml: checkYaml(content),
            isDone: checkDone(content),
            slidesDone: countOutput(content),
            slides: countInput(content),
          ),
        );
      }
    });
    return finalList;
  }

  bool checkYaml(List<ProjectsSnapshot> content) {
    if (content.any((element) => element.name.endsWith('.yaml'))) {
      return true;
    } else {
      return false;
    }
  }

  bool checkDone(List<ProjectsSnapshot> content) {
    if (content.any((element) => element.name.endsWith('.aup3'))) {
      return true;
    } else {
      return false;
    }
  }

  int countOutput(List<ProjectsSnapshot> content) {
    var count = 0;
    for (final element in content) {
      if (element.name.endsWith('.mp3')) {
        count++;
      }
    }
    return count;
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
}
