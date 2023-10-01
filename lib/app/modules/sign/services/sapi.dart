import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:plate_planner/app/modules/sign/controllers/sign_controller.dart';

class Api extends GetxController {
  
  static const baseurl = "http://192.168.43.54:8080/user";
  
//http://172.20.10.3/user
  static Future<bool> adduser(Map data) async {
    try {
      var sController=Get.put(SignController());
      print("==");
      print(data);
      print(data["contact_number"]);

      var uri=Uri.parse(baseurl);
      final res = await http.post(uri,body: data);

      bool ack=true;
      if (res.statusCode == 200) {
        print("all ok data is not avalabel");

        sController.sendotp(data["contact_number"],data);
        
        return true;

      } else if (res.statusCode == 401) {
        //sController.sendotp(data["contact_number"]);
        print("data is avalabel");
        ack=false;
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
    return false;
    //print(data);
  }
}
