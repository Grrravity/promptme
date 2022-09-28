import 'package:get/instance_manager.dart';

class StartControllerBinding extends Bindings {
  StartControllerBinding();

  @override
  void dependencies() {
    Get.lazyPut(StartControllerBinding.new);
  }
}
