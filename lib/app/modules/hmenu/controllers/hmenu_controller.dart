import 'dart:convert';
import 'package:get/get.dart';
import 'package:plate_planner/app/modules/hmenu/bindings/menumodel.dart';
import 'package:http/http.dart' as http;

class HmenuController extends GetxController {
  //TODO: Implement HmenuController

  Future fetchmenudata() async {
  final response = await http
      .post(Uri.parse('http://172.20.10.3:8080/smenu'));

  print("this is hmenu controller");
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    
    print(response.body);
    List<Menudata> jsonData = menudataFromJson(response.body);
    

      return jsonData;
      
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


  Future fetchmenudatanext() async {
  final response = await http
      .post(Uri.parse('http://172.20.10.3:8080/shownextmenu'));

  print("this is hmenu controller");
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    
    print(response.body);
    List<Menudata> jsonData = menudataFromJson(response.body);
    

      return jsonData;
      
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
