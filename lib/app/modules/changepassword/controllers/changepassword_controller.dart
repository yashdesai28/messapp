import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChangepasswordController extends GetxController {
  //TODO: Implement ChangepasswordController

  static uppass(Map data) async {

    const baseurl = "http://192.168.43.54:8080/chpass";

    try{

      var uri=Uri.parse(baseurl);
      final res = await http.post(uri,body:data);

      if (res.statusCode == 200) {
        print("add user in database");
        
        Get.toNamed('/home');

        

      } else if (res.statusCode == 401) {
        //sController.sendotp(data["contact_number"]);
        print("somthing wents worng");
      }


    }catch(e){

      print(e);

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
