import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plate_planner/app/data/secure_storage.dart';
class HuserController extends GetxController {
  //TODO: Implement HuserController

  static const baseurl = "http://172.20.10.3:8080/showh";

  String pho = '';
  String fname='';
  String lname= '';
  String email='';
  String phoneNumber='';
  String room='';
  String htype='';

  RxString fnamer=''.obs;


  static getdata(String pho) {
    print('user controller $pho');
  }

  final count = 0.obs;
  @override
  Future<void> onInit()  async {
    pho = await securestorage().readsecurestorage('userlogin');

    var data = {
      "contact_number": pho,
    };

    var uri = Uri.parse(baseurl);
    final res = await http.post(uri, body: data);

    var jsonData = json.decode(res.body);    


    fname=jsonData[0]["hosteler_fname"];
    fnamer=RxString(fname);
    print(fnamer.value);
    lname=jsonData[0]["hosteler_lname"];
    email=jsonData[0]["hosteler_email"];
    phoneNumber=jsonData[0]["hosteler_contact_number"].toString();
    room=jsonData[0]["room_no"].toString();
    htype=jsonData[0]["hostel_type"].toString();



    print("on init");
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
