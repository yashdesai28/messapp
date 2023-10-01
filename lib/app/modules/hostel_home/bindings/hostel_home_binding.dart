import 'package:get/get.dart';

import '../controllers/hostel_home_controller.dart';

class HostelHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HostelHomeController>(
      () => HostelHomeController(),
    );
  }
}
