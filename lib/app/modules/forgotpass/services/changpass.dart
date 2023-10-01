import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:plate_planner/app/modules/forgotpass/controllers/forgotpass_controller.dart';
import 'package:plate_planner/app/modules/sign/controllers/sign_controller.dart';

class forpassApi extends GetxController {
  
  static const baseurl = "http://192.168.43.54:8080/user";
  
//http://172.20.10.3/user
  static password(Map data) async {
    try {

      var fController=Get.put(ForgotpassController());
      print("==");
      print(data);
      print(data["contact_number"]);

      var uri=Uri.parse(baseurl);
      final res = await http.post(uri,body: data);

      if (res.statusCode == 200) {
        print("data not  avalabel");

        return false;

      } else if (res.statusCode == 401) {

        fController.sendotp(data["contact_number"]);
        print("data is avalabel");
        
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    print(data);
  }
}
