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
                        style: Get.textTheme.subtitle2!.copyWith(
                          color: (projects[index].extractsDone ?? 0) ==
                                  (projects[index].extracts ?? 0)
                              ? green
                              : black,
                        ),
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
              projects[index].entity.path,
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
          (project.extractsDone ?? 0) >= (project.extracts ?? 0)) {
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
      if ((project.isDone ?? false) &&
          (project.extractsDone ?? 0) >= (project.extracts ?? 0)) {
        return orangeChart;
      } else if (project.isDone ?? false) {
        return blueChart;
      } else {
        return green;
      }
    } else {
      return primary;
    }
  }
}
