import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:promptme/domain/entities/projects.dart';
import 'package:yaml/yaml.dart';

class PrepareController extends GetxController with StateMixin<RxStatus> {
  RxString dir = ''.obs;
  RxList<ProjectsSnapshot> projects = <ProjectsSnapshot>[].obs;
  RxList<String> prompteur = <String>[].obs;

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
        await getPrompt();
      }
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
    super.onReady();
  }

  Future<List<ProjectsSnapshot>> getContent(
    Directory directory,
  ) async {
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

  Future<void> getPrompt() async {
    if (projects.any((element) => element.name.endsWith('.yaml'))) {
      try {
        final yamlElement =
            projects.firstWhere((element) => element.name.endsWith('.yaml'));

        final file = File(yamlElement.entity.path);
        final yamlString = await file.readAsString();

        final yamlDoc = loadYamlDocument(yamlString);
        final yamlContent = yamlDoc.contents;
        final yaml = yamlContent.value as YamlMap;

        final sections = yaml['sections'] as YamlList;
        for (final d in sections.nodes) {
          prompteur.add(d.value['text'] as String);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  void retry() {
    onInit();
  }
}
