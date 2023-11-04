import 'package:get/get.dart';

import '../controllers/guestanalysis_controller.dart';

class GuestanalysisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuestanalysisController>(
      () => GuestanalysisController(),
    );
  }
}
