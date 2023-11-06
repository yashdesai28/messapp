import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChangePasswordController extends GetxController {
  

  
  static const baseurl = "http://172.20.10.3:8080/forgotpassword";
  
//http://172.20.10.3/user
  static updatepassword(Map data) async {
    try {
      //var sController=Get.put(SignController());
      print("==");
      print(data);
      print(data["contact_number"]);

      var uri=Uri.parse(baseurl);
      final res = await http.post(uri,body: data);

      if (res.statusCode == 200) {
        print("all ok password is update");

        Get.toNamed('/login');

       // sController.sendotp(data["contact_number"],data);

      } else if (res.statusCode == 401) {
        //sController.sendotp(data["contact_number"]);
        print("password is not update ");
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    print(data);
  }




  //TODO: Implement ChangePasswordController

  final count = 0.obs;
  @override
  void onInit() {
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

  // void increment() => count.value++;
  

}