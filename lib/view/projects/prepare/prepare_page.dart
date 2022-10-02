import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
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
        LogicalKeySet(LogicalKeyboardKey.space): const PlayIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowUp): const SizeUpIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowDown): const SizeDownIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowLeft): const SpeedDownIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowRight): const SpeedUpIntent(),
        LogicalKeySet(LogicalKeyboardKey.keyE): const ToggleEditionIntent(),
        LogicalKeySet(LogicalKeyboardKey.keyS): const RewindIntent(),
        LogicalKeySet(LogicalKeyboardKey.keyR): const RecordIntent(),
        LogicalKeySet(LogicalKeyboardKey.keyP): const PlayPauseRecordIntent(),
        LogicalKeySet(LogicalKeyboardKey.keyT): const StopRecordIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          PlayIntent: CallbackAction<PlayIntent>(
            onInvoke: (PlayIntent intent) => controller.toggleScroll(),
          ),
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
          ToggleEditionIntent: CallbackAction<ToggleEditionIntent>(
            onInvoke: (ToggleEditionIntent intent) =>
                controller.toggleEdition(),
          ),
          RecordIntent: CallbackAction<RecordIntent>(
            onInvoke: (RecordIntent intent) => controller.record(),
          ),
          PlayPauseRecordIntent: CallbackAction<PlayPauseRecordIntent>(
            onInvoke: (PlayPauseRecordIntent intent) => controller.playPause(),
          ),
          StopRecordIntent: CallbackAction<StopRecordIntent>(
            onInvoke: (StopRecordIntent intent) => controller.stopRecord(),
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
                            toggleEdition: () => controller.toggleEdition(),
                            isEditionEnabled: controller.isEditEnabled.value,
                            isScrolling: controller.isScrollOngoing.value,
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
                                      vertical: 300,
                                    ),
                                    itemCount: controller.prompteur.length,
                                    itemBuilder: (context, index) => Builder(
                                      builder: (context) {
                                        return Obx(() {
                                          return PrompteurPreview(
                                            controller.getTextToDisplay(index),
                                            fontSize: controller.fontSize.value,
                                            isEditionEnabled:
                                                controller.isEditEnabled.value,
                                            onSave: (text) =>
                                                controller.updateSlideContent(
                                              index,
                                              text,
                                            ),
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
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 20),
              child: Obx(
                () => SpeedDial(
                  direction: SpeedDialDirection.left,
                  renderOverlay: false,
                  backgroundColor: controller.isRecording.value
                      ? green
                      : Get.theme.colorScheme.secondary,
                  isOpenOnStart: true,
                  childPadding: const EdgeInsets.all(5),
                  spaceBetweenChildren: 4,
                  closeManually: true,
                  children: [
                    SpeedDialChild(
                      child: const Tooltip(
                        message: "Raccourci : barre d'espace",
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: white,
                          size: 38,
                        ),
                      ),
                      backgroundColor: Get.theme.colorScheme.secondary,
                      onTap: () => controller.playScroll(),
                    ),
                    SpeedDialChild(
                      child: const Tooltip(
                        message: "Raccourci : barre d'espace",
                        child: Icon(
                          Icons.pause_rounded,
                          color: white,
                          size: 38,
                        ),
                      ),
                      backgroundColor: Get.theme.colorScheme.secondary,
                      onTap: () => controller.pauseScroll(),
                    ),
                    SpeedDialChild(
                      child: const Tooltip(
                        message: 'Raccourci : touche "S"',
                        child: Icon(
                          Icons.fast_rewind_rounded,
                          color: white,
                          size: 38,
                        ),
                      ),
                      backgroundColor: Get.theme.colorScheme.secondary,
                      onTap: () => controller.scrollToStart(),
                    ),
                    SpeedDialChild(
                      label: 'Enregistrer audio',
                      child: const Tooltip(
                        message: 'Raccourci : touche "R"',
                        child: Icon(
                          Icons.mic_outlined,
                          color: primary,
                          size: 38,
                        ),
                      ),
                      backgroundColor: white,
                      onTap: () => controller.record(),
                    ),
                    SpeedDialChild(
                      label: 'Pause rec',
                      child: const Tooltip(
                        message: 'Raccourci : touche "P"',
                        child: Icon(
                          Icons.fast_rewind_rounded,
                          color: primary,
                          size: 38,
                        ),
                      ),
                      backgroundColor: white,
                      onTap: () => controller.pauseRecord(),
                    ),
                    SpeedDialChild(
                      label: 'Reprise rec',
                      child: const Tooltip(
                        message: 'Raccourci : touche "P"',
                        child: Icon(
                          Icons.fast_rewind_rounded,
                          color: primary,
                          size: 38,
                        ),
                      ),
                      backgroundColor: white,
                      onTap: () => controller.unPauseRecord(),
                    ),
                    SpeedDialChild(
                      label: 'Terminer rec',
                      child: const Tooltip(
                        message: 'Raccourci : touche "T"',
                        child: Icon(
                          Icons.fast_rewind_rounded,
                          color: primary,
                          size: 38,
                        ),
                      ),
                      backgroundColor: white,
                      onTap: () => controller.stopRecord(),
                    ),
                  ],
                  animationDuration: Duration.zero,
                  child: Icon(
                    controller.isRecording.value
                        ? controller.isPauseRecording.value
                            ? Icons.mic_off_rounded
                            : Icons.mic_rounded
                        : LineAwesomeIcons.broadcast_tower,
                    color: white,
                    size: 38,
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

class ToggleEditionIntent extends Intent {
  const ToggleEditionIntent();
}

class RewindIntent extends Intent {
  const RewindIntent();
}

class RecordIntent extends Intent {
  const RecordIntent();
}

class PlayPauseRecordIntent extends Intent {
  const PlayPauseRecordIntent();
}

class StopRecordIntent extends Intent {
  const StopRecordIntent();
}
