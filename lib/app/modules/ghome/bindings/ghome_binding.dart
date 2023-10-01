import 'package:get/get.dart';

import '../controllers/ghome_controller.dart';

class GhomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GhomeController>(
      () => GhomeController(),
    );
  }
}
