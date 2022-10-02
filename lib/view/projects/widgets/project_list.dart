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
          title: RichText(
            text: TextSpan(
              text: projects[index].name,
              style: Get.textTheme.headline5,
              children: <TextSpan>[
                if (projects[index].hasYaml ?? false)
                  TextSpan(
                    text: '   -   Contenu : ',
                    style: Get.textTheme.subtitle1,
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            '${projects[index].extractsDone} mp3 / ${projects[index].extracts} extraits',
                        style: Get.textTheme.subtitle2,
                      ),
                    ],
                  )
                else
                  TextSpan(
                    text:
                        '   -   Aucun yaml présent   -   ${projects[index].extractsDone} mp3',
                    style: Get.textTheme.subtitle1,
                  )
              ],
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              partialPath.join('/'),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Get.textTheme.bodyText2,
            ),
          ),
          leading: Icon(
            getIcon(projects[index]),
            color: getColor(projects[index]),
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

  IconData getIcon(ProjectsSnapshot project) {
    if (project.hasYaml ?? false) {
      if ((project.isDone ?? false) &&
          project.extracts == project.extractsDone) {
        return Icons.replay_rounded;
      } else {
        return Icons.play_arrow_rounded;
      }
    } else {
      return Icons.play_disabled_rounded;
    }
  }

  Color getColor(ProjectsSnapshot project) {
    if (project.hasYaml ?? false) {
      if (project.isDone ?? false) {
        return orangeChart;
      } else {
        return green;
      }
    } else {
      return primary;
    }
  }
}
