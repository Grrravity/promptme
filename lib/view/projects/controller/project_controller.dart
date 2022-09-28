// ignore_for_file: avoid_slow_async_io

import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class ProjectsController extends GetxController with StateMixin<RxStatus> {
  RxList<FileSystemEntity> projects = <FileSystemEntity>[].obs;
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

  void startProject(int index) {}

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
    if (workingDirPath.value != '') {
      final directory = Directory(workingDirPath.value);
      final exist = await directory.exists();
      if (exist) {
        projects.value = await getContent(directory);
      }
    }
  }

  Future<List<FileSystemEntity>> getContent(
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
    return recursive ? filterContent(subFolders) : Future.value(subFolders);
  }

  Future<List<FileSystemEntity>> filterContent(
    List<FileSystemEntity> subFolders,
  ) async {
    final finalList = <FileSystemEntity>[];
    await Future.forEach(subFolders, (folder) async {
      final directory = Directory(folder.path);

      final exist = await directory.exists();
      if (exist) {
        final content = await getContent(directory, recursive: false);
        if (content.any((element) => element.path.contains('.yaml'))) {
          finalList.add(folder);
        }
      }
    });
    return finalList;
  }
}
