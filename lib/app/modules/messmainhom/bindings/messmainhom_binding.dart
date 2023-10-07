import 'package:get/get.dart';

import '../controllers/messmainhom_controller.dart';

class MessmainhomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessmainhomController>(
      () => MessmainhomController(),
    );
  }
}
