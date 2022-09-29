import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promptme/core/theme/theme_color.dart';
import 'package:promptme/domain/entities/projects.dart';

class ProjectList extends StatelessWidget {
  const ProjectList(this.projects, {super.key, required this.onTap});
  final List<ProjectsSnapshot> projects;
  final void Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final partialPath = projects[index].entity.path.split('/')
          ..replaceRange(
            0,
            projects[index].entity.path.split('/').length - 5,
            ['...'],
          );
        return ListTile(
          title: Text(
            '${projects[index].name} - ${projects[index].hasYaml ?? false ? 'Slides attendues : ${projects[index].slides} - mp3 générés : ${projects[index].slidesDone}' : 'Aucun yaml présent'}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.headline5,
          ),
          subtitle: Text(
            partialPath.join('/'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.caption,
          ),
          leading: Icon(
            (projects[index].hasYaml ?? false)
                ? (projects[index].isDone ?? false)
                    ? (projects[index].slides == projects[index].slidesDone)
                        ? Icons.replay
                        : Icons.play_arrow_rounded
                    : Icons.play_arrow_rounded
                : Icons.play_disabled,
            color: (projects[index].hasYaml ?? false)
                ? (projects[index].isDone ?? false)
                    ? orangeChart
                    : green
                : primary,
            size: 40,
          ),
          enabled: projects[index].hasYaml ?? false,
          onTap: () => (projects[index].hasYaml ?? false) ? onTap(index) : null,
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 1,
        );
      },
    );
  }
}
