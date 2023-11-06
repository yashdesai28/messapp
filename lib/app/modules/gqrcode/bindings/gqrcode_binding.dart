import 'package:get/get.dart';

import '../controllers/gqrcode_controller.dart';

class GqrcodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GqrcodeController>(
      () => GqrcodeController(),
    );
  }
}
