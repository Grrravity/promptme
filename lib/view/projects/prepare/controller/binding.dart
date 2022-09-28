import 'package:get/instance_manager.dart';

class PrepareControllerBinding extends Bindings {
  PrepareControllerBinding();

  @override
  void dependencies() {
    Get.lazyPut(PrepareControllerBinding.new);
  }
}
