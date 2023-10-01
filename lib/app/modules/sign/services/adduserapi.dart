import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:plate_planner/app/modules/sign/controllers/sign_controller.dart';

class adduApi extends GetxController {
  
  static const baseurl = "http://192.168.43.54:8080/greg";
  
//http://172.20.10.3/user
  static adduser(Map data) async {
    try {
      
      print("thisssss issss addd user apiiiii");
      print("==");
      print(data);
      print(data["contact_number"]);

      var uri=Uri.parse(baseurl);
      final res = await http.post(uri,body:data);

      if (res.statusCode == 200) {
        print("add user in database");
        
        Get.toNamed('/login');

        

      } else if (res.statusCode == 401) {
        //sController.sendotp(data["contact_number"]);
        print("somthing wents worng");
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    
  }
}
