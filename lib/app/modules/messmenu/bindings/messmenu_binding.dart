import 'package:get/get.dart';

import '../controllers/messmenu_controller.dart';

class MessmenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessmenuController>(
      () => MessmenuController(),
    );
  }
}
