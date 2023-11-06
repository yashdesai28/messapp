import 'dart:convert';

import 'package:get/get.dart';
import 'package:plate_planner/app/data/secure_storage.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  //TODO: Implement UserController

  static const baseurl = "http://172.20.10.3:8080/show";

  String pho = '';
  String fname='';
  String lname= '';
  String email='';
  String phoneNumber='';

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


    fname=jsonData[0]["guest_fname"];
    fnamer=RxString(fname);
    print(fnamer.value);
    lname=jsonData[0]["guest_lname"];
    email=jsonData[0]["guest_email"];
    phoneNumber=jsonData[0]["guest_contact_number"].toString();



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
