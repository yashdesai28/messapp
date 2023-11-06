import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GuestanalysisController extends GetxController {
  //TODO: Implement GuestanalysisController

  
  Future gfetchmenudata() async {
    final response =
        await http.post(Uri.parse('http://172.20.10.3:8080/ganalysis'));

    print("this is hmenu controller");
    if (response.statusCode == 200) {
      var analysis_data = json.decode(response.body);

      print(analysis_data["total_current_booking"]);
      print(response.body);

      return analysis_data;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
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
