import 'package:get/instance_manager.dart';
import 'package:promptme/view/projects/start/controller/start_controller.dart';

class StartControllerBinding extends Bindings {
  StartControllerBinding();

  @override
  void dependencies() {
    Get.lazyPut(StartController.new);
  }
}
