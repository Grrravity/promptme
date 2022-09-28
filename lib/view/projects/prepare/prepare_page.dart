import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:promptme/core/theme/theme_color.dart';
import 'package:promptme/core/widgets/x_empty_widget.dart';
import 'package:promptme/core/widgets/x_error_widget.dart';
import 'package:promptme/view/projects/prepare/controller/prepare_controller.dart';

class PreparePage extends GetView<PrepareController> {
  const PreparePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.bottomAppBarColor,
        title: Obx(() {
          return Text(
            'Prepare',
            style: Get.textTheme.headline4,
          );
        }),
        centerTitle: true,
      ),
      body: controller.obx(
        (status) => const XEmptyWidget(message: 'Ce projet est vide'),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (e) => XErrorWidget(
          error: e ?? 'Erreur inattendue',
          onRetry: () => controller.retry(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Get.theme.colorScheme.secondary,
        onPressed: () => debugPrint('heee'),
        child: const Icon(
          LineAwesomeIcons.play_circle,
          color: white,
        ),
      ),
    );
  }
}
