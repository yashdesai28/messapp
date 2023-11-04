import 'package:get/get.dart';

import '../controllers/hosteleranalysis_controller.dart';

class HosteleranalysisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HosteleranalysisController>(
      () => HosteleranalysisController(),
    );
  }
}
