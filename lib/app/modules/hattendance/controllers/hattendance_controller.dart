import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:plate_planner/app/data/secure_storage.dart';

class HattendanceController extends GetxController {
  static const baseurl = "http://172.20.10.3:8080/bookedmeals";
  //TODO: Implement HattendanceController

  Future bookedmeals(List<bool> dlist) async {
    try {
      var pho = await securestorage().readsecurestorage('userlogin');

      print("bookcontroller ${dlist}");
      print("pho from sequristorage ${pho}");

      var data = {
        "contact_number": pho,
        "breakfast": dlist[0].toString(),
        "lunch": dlist[1].toString(),
        "dinner": dlist[2].toString()
      };

      print(data);

      print("thiss iss a hattendance  services ");
      var uri = Uri.parse(baseurl);
      final res = await http.post(uri, body: data);

      if (res.statusCode == 200) {
        var jsonData = json.decode(res.body);
        var jsonstring = res.body;
        print(jsonData[0]["date"]);
        print(jsonstring);

        String date = jsonData[0]["date"];

        // DateTime currentDate = DateTime.now();

        // // Get the next day
        // DateTime nextDay = currentDate.add(Duration(days: 1));

        // // Format the dates
        // String currentFormatted =
        //     "${currentDate.year}-${currentDate.month}-${currentDate.day}";
        // String formattedDate =
        //     "${nextDay.day}/${nextDay.month}/${nextDay.year}";

        // print("Current date: $currentFormatted");
        // print("Next day and date: $formattedDate");

        // securestorage().storemeaddata("bookmeals", formattedDate);
        // var sec = await securestorage().readmealsdata('bookmeals');

        // print("hattendance controller== ${sec}");
        Get.toNamed('/qrcode');
      } else {}
    } catch (err) {
      print(err);
    }
  }

  // chek user fill next day fill form or not

  static const cbaseurl = "http://172.20.10.3:8080/showmeals";
  //TODO: Implement HattendanceController

  Future chekmeals() async {
    try {
      DateTime currentDate = DateTime.now();

      // Get the next day
      DateTime nextDay = currentDate.add(Duration(days: 1));

      String formattedDate = "${nextDay.day}/${nextDay.month}/${nextDay.year}";

      var pho = await securestorage().readsecurestorage('userlogin');
      var date = formattedDate;

      var data = {"contact_number": pho, "date": date};

      print(data);

      print("thiss iss chek next day from fill or not  services ");
      var uri = Uri.parse(cbaseurl);
      final res = await http.post(uri, body: data);
      var jsonData = json.decode(res.body);
      var jsonstring = res.body;
      if (res.statusCode == 200) {
        print(jsonstring);

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
