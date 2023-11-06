import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:plate_planner/app/data/secure_storage.dart';

class GqrcodeController extends GetxController {
  //TODO: Implement GqrcodeController
  
  static const baseurl = "http://172.20.10.3:8080/gshowmeals";
  //TODO: Implement HattendanceController

  Future gshowmeals() async {
    try {
      DateTime currentDate = DateTime.now();

      // Format the date as a string
      String formattedDate =
          "${currentDate.day}/${currentDate.month}/${currentDate.year}";

      var pho = await securestorage().readsecurestorage('userlogin');
      var date = formattedDate;

      var data = {"contact_number": pho, "date": date};

      print(data);

      print("thiss iss qr services   services ");
      var uri = Uri.parse(baseurl);
      final res = await http.post(uri, body: data);

       var jsonData = json.decode(res.body);
        var jsonstring = res.body;
       

      if (res.statusCode == 200) {
        //  print(mealsdata);

        print(jsonstring);

        return jsonstring;
      } else {
        return jsonstring;
      }
    } catch (err) {
      print(err);
    }
  }



//chek user meals booked or not
  static const cbaseurl = "http://172.20.10.3:8080/gshowmeals";
  Future chekmeals() async {
    try {
      DateTime currentDate = DateTime.now();

      // Format the date as a string
      String formattedDate =
          "${currentDate.day}/${currentDate.month}/${currentDate.year}";

      var pho = await securestorage().readsecurestorage('userlogin');
      var date = formattedDate;

      var data = {"contact_number": pho, "date": date};

      print(data);

      print("thiss iss qr services   services ");
      var uri = Uri.parse(cbaseurl);
      final res = await http.post(uri, body: data);

      var jsonData = json.decode(res.body);
      var jsonstring = res.body;

      if (res.statusCode == 200) {
        //  print(mealsdata);

        print(jsonData);

        return jsonData;
      } else {
        return jsonData;
      }
    } catch (err) {
      print(err);
    }
  }

  

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

  void increment() => count.value++;
}
