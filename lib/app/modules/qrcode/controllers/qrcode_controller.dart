import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:plate_planner/app/data/secure_storage.dart';

class QrcodeController extends GetxController {
  //TODO: Implement QrcodeController

  static const baseurl = "http://192.168.43.54:8080/showmeals";
  //TODO: Implement HattendanceController

  Future showmeals() async {
    try {
      DateTime currentDate = DateTime.now();

      // Format the date as a string
      String formattedDate =
          "${currentDate.day}/${currentDate.month}/${currentDate.year}";

      var pho = await securestorage().readsecurestorage('userloginh');
      var date = formattedDate;

      var data = {"contact_number": pho, "date": date};

      print(data);

      print("thiss iss qr services   services ");
      var uri = Uri.parse(baseurl);
      final res = await http.post(uri, body: data);

      if (res.statusCode == 200) {
        
        var jsonData = json.decode(res.body);
        var jsonstring = res.body;
        print(jsonData[0]["date"]);
        print(jsonData[0]["contact_number"]);
        print(jsonData[0]["date"]);
        print(jsonData[0]["hostel_type"]);
        print(jsonData[0]["breakfast"]);
        print(jsonData[0]["lunch"]);
        print(jsonData[0]["dinner"]);
        print(jsonData[0]["breakfast_attendance"]);
        print(jsonData[0]["lunch_attendance"]);
        print(jsonData[0]["dinner_attendance"]);

        // String mealsdata = "date: " +
        //     jsonData[0]["date"] +
        //     "\n" +
        //     "contact number: " +
        //     jsonData[0]["contact_number"] +
        //     "\n" +
        //     "date: " +
        //     jsonData[0]["date"] +
        //     "\n" +
        //     "hostel_type:" +
        //     jsonData[0]["hostel_type"] +
        //     "\n" +
        //     "breakfast:" +
        //     jsonData[0]["breakfast"] +
        //     "\n" +
        //     "lunch: " +
        //     jsonData[0]["lunch"] +
        //     "\n" +
        //     "dinner:" +
        //     jsonData[0]["dinner"] +
        //     "\n" +
        //     "breakfast_attendance: " +
        //     jsonData[0]["breakfast_attendance"] +
        //     "\n" +
        //     "lunch_attendance: " +
        //     jsonData[0]["lunch_attendance"] +
        //     "\n" +
        //     "dinner_attendance: " +
        //     jsonData[0]["dinner_attendance"];

        //  print(mealsdata);

        print(jsonstring);

        return jsonstring;
      } else {
        return null;
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
