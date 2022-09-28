import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectList extends StatelessWidget {
  const ProjectList(this.projects, {super.key, required this.onTap});
  final List<String> projects;
  final void Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            projects[index],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.headline5,
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
