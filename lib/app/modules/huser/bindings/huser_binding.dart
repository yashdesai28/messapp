import 'package:get/get.dart';

import '../controllers/huser_controller.dart';

class HuserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HuserController>(
      () => HuserController(),
    );
  }
}
