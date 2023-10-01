import 'package:get/get.dart';

import '../controllers/hmenu_controller.dart';

class HmenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HmenuController>(
      () => HmenuController(),
    );
  }
}
