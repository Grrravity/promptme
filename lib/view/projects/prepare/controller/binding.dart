import 'package:get/instance_manager.dart';
import 'package:promptme/view/projects/prepare/controller/prepare_controller.dart';

class PrepareControllerBinding extends Bindings {
  PrepareControllerBinding();

  @override
  void dependencies() {
    Get.lazyPut(PrepareController.new);
  }
}
