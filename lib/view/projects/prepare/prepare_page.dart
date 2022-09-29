import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:promptme/core/theme/theme_color.dart';
import 'package:promptme/core/widgets/x_empty_widget.dart';
import 'package:promptme/core/widgets/x_error_widget.dart';
import 'package:promptme/view/projects/prepare/controller/prepare_controller.dart';
import 'package:promptme/view/projects/prepare/widget/prompteur_preview.dart';
import 'package:promptme/view/projects/prepare/widget/settings.dart';

class PreparePage extends GetView<PrepareController> {
  const PreparePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: black,
          ),
          // ignore: inference_failure_on_generic_invocation
          onPressed: Get.back,
        ),
        backgroundColor: Get.theme.bottomAppBarColor,
        title: Obx(() {
          return Text(
            controller.dir.value == '' ? '' : basename(controller.dir.value),
            style: Get.textTheme.headline4,
          );
        }),
        centerTitle: true,
      ),
      body: controller.obx(
        (status) => controller.projects.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Settings(),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            color: Get.theme.primaryColor,
                            padding: const EdgeInsets.all(16),
                            child: ListView.builder(
                              itemCount: controller.prompteur.length,
                              itemBuilder: (context, index) =>
                                  PrompteurPreview(controller.prompteur[index]),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            child: Container(
                              height: 50,
                              width: Get.width,
                              color: white.withOpacity(0.2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const XEmptyWidget(message: 'Ce projet est vide'),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (e) => XErrorWidget(
          error: e ?? 'Erreur inattendue',
          onRetry: () => controller.retry(),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20),
        child: FloatingActionButton(
          backgroundColor: Get.theme.colorScheme.secondary,
          onPressed: () => debugPrint('heee'),
          child: const Icon(
            Icons.play_arrow_rounded,
            color: white,
            size: 38,
          ),
        ),
      ),
    );
  }
}
