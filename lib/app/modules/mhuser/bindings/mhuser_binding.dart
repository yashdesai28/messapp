import 'package:get/get.dart';

import '../controllers/mhuser_controller.dart';

class MhuserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MhuserController>(
      () => MhuserController(),
    );
  }
}
