import 'package:get/get.dart';

class StartController extends GetxController with StateMixin<RxStatus> {
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

  void retry() {
    onInit();
  }
}
