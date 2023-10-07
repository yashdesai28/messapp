import 'package:get/get.dart';

import '../controllers/mhdash_controller.dart';

class MhdashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MhdashController>(
      () => MhdashController(),
    );
  }
}
