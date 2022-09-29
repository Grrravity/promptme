import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart';

part 'projects.freezed.dart';

@freezed
class Projects with _$Projects {
  const factory Projects({
    required String name,
    required FileSystemEntity entity,
    required bool isFolder,
    DateTime? updatedAt,
    bool? hasYaml,
    bool? isDone,
    int? slides,
    int? slidesDone,
    int? wordCound,
  }) = _Projects;
}

@freezed
class ProjectsSnapshot with _$ProjectsSnapshot {
  const factory ProjectsSnapshot({
    required String name,
    required FileSystemEntity entity,
    required bool isFolder,
    DateTime? updatedAt,
    bool? hasYaml,
    bool? isDone,
    int? slides,
    int? slidesDone,
    int? wordCound,
  }) = _ProjectsSnapshot;

  factory ProjectsSnapshot.fromDomain(Projects project) {
    return ProjectsSnapshot(
      name: project.name,
      entity: project.entity,
      updatedAt: project.updatedAt,
      isFolder: project.isFolder,
      hasYaml: project.hasYaml,
      isDone: project.isDone,
      slides: project.slides,
      slidesDone: project.slidesDone,
      wordCound: project.wordCound,
    );
  }

  factory ProjectsSnapshot.fromFileEntity(FileSystemEntity entity) {
    try {
      final file = File(entity.path);
      final isFile = !File(entity.path).existsSync();
      if (isFile) {
        return ProjectsSnapshot(
          name: basename(entity.path),
          entity: entity,
          isFolder: false,
          updatedAt: file.lastModifiedSync(),
          isDone: false,
          wordCound: 0,
        );
      } else {
        throw Exception("Ce n'est pas un fichier");
      }
    } catch (_) {
      return ProjectsSnapshot(
        name: basename(entity.path),
        entity: entity,
        isFolder: true,
        hasYaml: false,
        isDone: false,
        slides: 0,
        slidesDone: 0,
        wordCound: 0,
      );
    }
  }

  factory ProjectsSnapshot.fromSnapshot(ProjectsSnapshot project) =>
      ProjectsSnapshot(
        name: project.name,
        entity: project.entity,
        updatedAt: project.updatedAt,
        isFolder: project.isFolder,
        hasYaml: project.hasYaml,
        isDone: project.isDone,
        slides: project.slides,
        slidesDone: project.slidesDone,
        wordCound: project.wordCound,
      );
}
