import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        LogicalKeySet(LogicalKeyboardKey.keyP): const PlayIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowUp): const SizeUpIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowDown): const SizeDownIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowLeft): const SpeedDownIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowRight): const SpeedUpIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          PlayIntent: CallbackAction<PlayIntent>(
              onInvoke: (PlayIntent intent) => controller.toggleScroll()),
          SizeUpIntent: CallbackAction<SizeUpIntent>(
            onInvoke: (SizeUpIntent intent) => controller.incrementFontSize(),
          ),
          SizeDownIntent: CallbackAction<SizeDownIntent>(
            onInvoke: (SizeDownIntent intent) => controller.decrementFontSize(),
          ),
          SpeedUpIntent: CallbackAction<SpeedUpIntent>(
            onInvoke: (SpeedUpIntent intent) =>
                controller.incrementWordPerMin(),
          ),
          SpeedDownIntent: CallbackAction<SpeedDownIntent>(
            onInvoke: (SpeedDownIntent intent) =>
                controller.decrementWordPerMin(),
          ),
        },
        child: Focus(
          autofocus: true,
          child: Scaffold(
            backgroundColor: Get.theme.primaryColor,
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
                  controller.dir.value == ''
                      ? ''
                      : '${basename(controller.dir.value)} - ${controller.extracts} extraits',
                  style: Get.textTheme.headline4,
                );
              }),
              centerTitle: true,
            ),
            body: controller.obx(
              (status) => controller.projects.isNotEmpty
                  ? Column(
                      children: [
                        Obx(
                          () => Settings(
                            fileName: controller.yamlName,
                            wordCount: controller.wordCount.value,
                            wordPerMin: controller.wordPerMin.value,
                            fontSize: controller.fontSize.value,
                            estimatedDuration: controller.duration,
                            incrementFontSize: () =>
                                controller.incrementFontSize(),
                            decrementFontSize: () =>
                                controller.decrementFontSize(),
                            incrementWordPerMin: () =>
                                controller.incrementWordPerMin(),
                            decrementWordPerMin: () =>
                                controller.decrementWordPerMin(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned(
                                top: Get.height * 0.25,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: Get.width,
                                      color: white.withOpacity(0.2),
                                    ),
                                    Positioned(
                                      top: 100,
                                      child: Container(
                                        height: 4,
                                        width: Get.width,
                                        color: primary.withOpacity(0.2),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Obx(
                                () => Scrollbar(
                                  thickness: 16,
                                  trackVisibility: true,
                                  thumbVisibility: true,
                                  controller: controller.scrollController,
                                  child: ListView.builder(
                                    cacheExtent: 300000,
                                    physics: controller.isScrollOngoing.value
                                        ? const NeverScrollableScrollPhysics()
                                        : const AlwaysScrollableScrollPhysics(),
                                    controller: controller.scrollController,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 300),
                                    itemCount: controller.prompteur.length,
                                    itemBuilder: (context, index) => Builder(
                                      builder: (context) {
                                        return Obx(() {
                                          return PrompteurPreview(
                                            controller
                                                .getListWithWordLimit(
                                                  content: controller
                                                      .prompteur[index],
                                                )
                                                .join('\n'),
                                            fontSize: controller.fontSize.value,
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const XEmptyWidget(message: 'Ce projet est vide'),
              onLoading: const Center(child: CircularProgressIndicator()),
              onError: (e) => XErrorWidget(
                error: e ?? 'Erreur inattendue',
                onRetry: () => controller.retry(),
              ),
            ),
            floatingActionButton: Tooltip(
              message: 'Raccourci : touche "P"',
              triggerMode: TooltipTriggerMode.longPress,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: FloatingActionButton(
                  backgroundColor: Get.theme.colorScheme.secondary,
                  onPressed: () => controller.toggleScroll(),
                  child: Obx(
                    () => Icon(
                      controller.isScrollOngoing.value
                          ? Icons.pause_circle_outline_rounded
                          : Icons.play_arrow_outlined,
                      color: white,
                      size: 38,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlayIntent extends Intent {
  const PlayIntent();
}

class SizeUpIntent extends Intent {
  const SizeUpIntent();
}

class SizeDownIntent extends Intent {
  const SizeDownIntent();
}

class SpeedUpIntent extends Intent {
  const SpeedUpIntent();
}

class SpeedDownIntent extends Intent {
  const SpeedDownIntent();
}
