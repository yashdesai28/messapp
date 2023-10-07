import 'package:get/get.dart';
import 'package:plate_planner/app/data/secure_storage.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  String pho = '';
  String role = '';

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    pho = await securestorage().readsecurestorage('userlogin');
    role = await securestorage().readsecurestorage('role');
    print("pho hom controller $pho");
    print("role hom controller $role");

    if (pho != 'No Data') {
      if (role == 'guests') {
        Get.toNamed("/guesthome");
      } else if (role == 'hostelar') {
        Get.toNamed("/hostel-home");
      }
      else if(role=='mess_handler'){
        Get.toNamed("/messmainhom");
      }
    }

    print("on init");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
