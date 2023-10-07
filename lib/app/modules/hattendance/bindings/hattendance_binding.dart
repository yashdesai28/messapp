import 'package:get/get.dart';

import '../controllers/hattendance_controller.dart';

class HattendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HattendanceController>(
      () => HattendanceController(),
    );
  }
}
