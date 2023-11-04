import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HosteleranalysisController extends GetxController {
  //TODO: Implement HosteleranalysisController

  Future fetchmenudata() async {
    final response =
        await http.post(Uri.parse('http://192.168.43.54:8080/analysis'));

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
