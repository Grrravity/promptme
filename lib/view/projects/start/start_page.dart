import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promptme/core/widgets/x_empty_widget.dart';
import 'package:promptme/core/widgets/x_error_widget.dart';
import 'package:promptme/view/projects/prepare/controller/prepare_controller.dart';

class StartPage extends GetView<PrepareController> {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.bottomAppBarColor,
        title: Obx(() {
          return Text(
            'Start',
            style: Get.textTheme.headline4,
          );
        }),
        centerTitle: true,
      ),
      body: controller.obx(
        (status) => const XEmptyWidget(message: ''),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (e) => XErrorWidget(
          error: e ?? 'Erreur inattendue',
          onRetry: () => controller.retry(),
        ),
      ),
    );
  }
}
