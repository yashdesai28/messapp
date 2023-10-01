import 'package:get/get.dart';

import '../controllers/gmenu_controller.dart';

class GmenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GmenuController>(
      () => GmenuController(),
    );
  }
}
