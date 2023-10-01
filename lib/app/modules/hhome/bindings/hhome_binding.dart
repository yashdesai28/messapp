import 'package:get/get.dart';

import '../controllers/hhome_controller.dart';

class HhomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HhomeController>(
      () => HhomeController(),
    );
  }
}
