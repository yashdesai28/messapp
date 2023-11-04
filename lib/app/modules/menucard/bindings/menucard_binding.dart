import 'package:get/get.dart';

import '../controllers/menucard_controller.dart';

class MenucardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenucardController>(
      () => MenucardController(),
    );
  }
}
