import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:promptme/core/theme/theme_color.dart';

class ProjectList extends StatelessWidget {
  const ProjectList(this.projects, {super.key, required this.onTap});
  final List<FileSystemEntity> projects;
  final void Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            basename(projects[index].path),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.headline5,
          ),
          subtitle: Text(
            '...${projects[index].path.substring(27)}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.caption,
          ),
          leading: const Icon(
            Icons.play_arrow_rounded,
            color: green,
            size: 40,
          ),
          onTap: () => onTap(index),
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
