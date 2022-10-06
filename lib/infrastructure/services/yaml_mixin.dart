import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:promptme/core/error/value_failure.dart';
import 'package:promptme/domain/entities/projects.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

mixin YamlMixin {
  Either<ProjectsSnapshot, ValueFailure<String>> getYamlElement(
    List<ProjectsSnapshot> content,
  ) {
    if (content.any((element) => element.name.endsWith('.yaml'))) {
      return left(
        content.firstWhere((element) => element.name.endsWith('.yaml')),
      );
    } else {
      return right(
        ValueFailure(
          message:
              'Aucun fichier yaml dans le dossier ${content.first.entity.path.replaceAllMapped('/${content.first.name}', (match) => '')}',
        ),
      );
    }
  }

  Either<YamlDocument, ValueFailure<String>> getYamlAsDocument(
    ProjectsSnapshot yamlElement,
  ) {
    try {
      final file = File(yamlElement.entity.path);
      final yamlString = file.readAsStringSync();

      final yamlDocument = loadYamlDocument(yamlString);
      return left(yamlDocument);
    } catch (e) {
      return right(
        ValueFailure(
          message: 'Impossible de charger le fichier yaml',
          details: e.toString(),
        ),
      );
    }
  }

  Either<int, ValueFailure<String>> countYamlInput(
    ProjectsSnapshot yamlElement,
  ) {
    return getYamlAsDocument(yamlElement).fold(
      (yamlDocument) {
        final yamlContent = yamlDocument.contents;
        try {
          final yaml = yamlContent.value as YamlMap;
          final yamlList = yaml['sections'] as YamlList;
          return left(yamlList.length);
        } catch (e) {
          throw ValueFailure(
            message:
                'Le fichier yaml semble être mal formaté. Verrifiez que la clée "sections" existe',
            details: e.toString(),
          );
        }
      },
      right,
    );
  }

  Either<YamlList, ValueFailure<String>> getYamlPromptText(
    ProjectsSnapshot yamlElement,
  ) {
    try {
      return getYamlAsDocument(yamlElement).fold(
        (document) {
          final yamlContent = document.contents;
          final yaml = yamlContent.value as YamlMap;

          final sections = yaml['sections'] as YamlList;
          return left(sections);
        },
        right,
      );
    } catch (e) {
      return right(
        ValueFailure(
          message:
              'Le fichier yaml semble être mal formaté. Verrifiez que la clée "sections" existe',
          details: e.toString(),
        ),
      );
    }
  }

  Future<Either<void, ValueFailure<String>>> updateYamlContent(
    ProjectsSnapshot yamlElement,
    String text,
    int index,
  ) async {
    try {
      final file = File(yamlElement.entity.path);
      final yamlString = await file.readAsString();

      final yamlEditor = YamlEditor(yamlString);

      final node = YamlScalar.wrap(
        text.replaceAllMapped('\n', (match) => ''),
        style: ScalarStyle.LITERAL,
      );
      yamlEditor.update(['sections', index, 'text'], node);
      await file.writeAsString(
        yamlEditor.toString().replaceAllMapped('|-', (match) => '|'),
      );
    } catch (e) {
      return right(
        ValueFailure(
          message: "Erreur d'écriture sur le fichier yaml",
          details: e.toString(),
        ),
      );
    }
    return right(
      ValueFailure(
        message: 'Erreur inatendue lors la mise à jour du fichier',
      ),
    );
  }
}
