import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:path/path.dart';
import 'package:promptme/core/theme/theme_color.dart';
import 'package:promptme/core/widgets/x_empty_widget.dart';
import 'package:promptme/core/widgets/x_error_widget.dart';
import 'package:promptme/view/projects/controller/project_controller.dart';
import 'package:promptme/view/projects/widgets/project_list.dart';

class ProjectsPage extends GetView<ProjectsController> {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.bottomAppBarColor,
        title: Obx(() {
          return Text(
            controller.workingDirPath.value == ''
                ? 'Aucun répertoire sélectionné'
                : basename(controller.workingDirPath.value),
            style: Get.textTheme.headline4!.copyWith(color: black),
          );
        }),
        centerTitle: true,
      ),
      body: controller.obx(
        (status) => Obx(
          () {
            return controller.projects.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(18),
                    child: ProjectList(
                      controller.projects,
                      onTap: (index) => controller.startProject(index),
                    ),
                  )
                : const XEmptyWidget(message: 'Aucun projet ajouté');
          },
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (e) => XErrorWidget(
          error: e ?? 'Erreur inattendue',
          onRetry: () => controller.retry(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Get.theme.colorScheme.secondary,
        onPressed: () => controller.findDirectory(context),
        child: const Icon(
          LineAwesomeIcons.folder_plus,
          color: white,
        ),
      ),
    );
  }
}
