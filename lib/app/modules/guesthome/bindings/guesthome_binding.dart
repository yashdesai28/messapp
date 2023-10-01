import 'package:get/get.dart';

import '../controllers/guesthome_controller.dart';

class GuesthomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuesthomeController>(
      () => GuesthomeController(),
    );
  }
}
