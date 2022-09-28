import 'package:get/instance_manager.dart';

class ProjectsControllerBinding extends Bindings {
  ProjectsControllerBinding();

  @override
  void dependencies() {
    Get.lazyPut(ProjectsControllerBinding.new);
  }
}
