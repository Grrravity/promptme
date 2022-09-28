import 'dart:io';

import 'package:get/get.dart';

class ProjectsController extends GetxController with StateMixin<RxStatus> {
  RxList<String> projects = <String>[].obs;
  late Rx<Directory>? directory;

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();
  }

  @override
  void onReady() {
    change(null, status: RxStatus.success());
    super.onReady();
  }

  void startProject(int index) {}

  void retry() {
    onInit();
  }

  void findDirectory() {}
}
