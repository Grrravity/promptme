import 'package:get/instance_manager.dart';
import 'package:promptme/view/projects/controller/project_controller.dart';

class ProjectsControllerBinding extends Bindings {
  ProjectsControllerBinding();

  @override
  void dependencies() {
    Get.lazyPut(ProjectsController.new);
  }
}
