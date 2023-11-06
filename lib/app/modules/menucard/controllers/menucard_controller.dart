import 'package:get/get.dart';
import 'package:plate_planner/app/modules/hmenu/bindings/menumodel.dart';
import 'package:http/http.dart' as http;

class MenucardController extends GetxController {
  static const baseurl = "http://172.20.10.3:8080/showmenu";
  //TODO: Implement MenucardController
  Future fetchmenudata(String days) async {

    try{
      
 
    var uri = Uri.parse(baseurl);

    print(days);

    var data = {"days": days};

    print(data);

    final response = await http.post(uri, body: data);

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
    catch(e){

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
