import 'package:get/get.dart';

import '../controllers/ghistory_controller.dart';

class GhistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GhistoryController>(
      () => GhistoryController(),
    );
  }
}
