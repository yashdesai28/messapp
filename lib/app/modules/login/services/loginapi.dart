import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:plate_planner/app/data/secure_storage.dart';
import 'package:plate_planner/app/modules/login/bindings/hostelaruser.dart';
import 'package:plate_planner/app/modules/login/bindings/usermodel.dart';
import 'package:plate_planner/app/modules/sign/controllers/sign_controller.dart';

class lApi extends GetxController {
  static const baseurl = "http://192.168.43.54:8080/login";

  var _isLoading = true.obs;

  void onInit() {
    super.onInit();
  }

//http://172.20.10.3/user
  static Future<bool>  adduser(Map data) async {
    var userd = <Userdata>[].obs;
    var huser = <Hostelaruser>[].obs;

    try {
      print("thiss iss a login services ");
      var uri = Uri.parse(baseurl);
      final res = await http.post(uri, body: data);

      if (res.statusCode == 200) {
        print("all ok data is avalabel");

        var jsonstring = res.body;

        var jsonData = json.decode(res.body);
        print(jsonData[1][0]["user_role"]);
        print(jsonData[1][0]["user_status"]);

        // role waise screen show
        String user_role = jsonData[1][0]["user_role"];
        int user_status = jsonData[1][0]["user_status"];

        print(jsonData[0][0]);
        print(jsonData[1][0]);

        var encodejson = jsonEncode(jsonData[0][0]);
        print('encodejson $encodejson');

        if (user_role == 'guests' && user_status == 1) {
          Userdata _userdata = userdataFromJson(encodejson);

          userd.add(Userdata(
              id: _userdata.id,
              guestFname: _userdata.guestFname,
              guestLname: _userdata.guestLname,
              guestEmail: _userdata.guestEmail,
              guestContactNumber: _userdata.guestContactNumber,
              v: _userdata.v));

          Userdata firstUserdata = userd[0];

          String phonenumber = firstUserdata.guestContactNumber.toString();

          print('this is a secure :$phonenumber');

          securestorage().writesecurestorage('userlogin', phonenumber);

          Get.toNamed("/guesthome");
          return true;

        } else if (user_role == 'hostelar' && user_status == 2) {
          Hostelaruser _huser = hostelaruserFromJson(encodejson);

          huser.add(Hostelaruser(
            id: _huser.id,
            hostelerFname: _huser.hostelerFname,
            hostelerLname: _huser.hostelerLname,
            hostelerEmail: _huser.hostelerEmail,
            hostelerContactNumber: _huser.hostelerContactNumber,
            roomNo: _huser.roomNo,
            hostelType: _huser.hostelType,
            v: _huser.v,
          ));
          print("hoste; elase");

          Hostelaruser firstUserdata = huser[0];

          String phonenumber = firstUserdata.hostelerContactNumber.toString();
          securestorage().writesecurestorage('userloginh', phonenumber);
          print('this is a secure :$phonenumber');

          Get.toNamed("/hostel-home");
          return true;

        } else {
          print("not athunticat user role ");
          return false;

        }
        print("all bottm");
      } else if (res.statusCode == 401) {
        //sController.sendotp(data["contact_number"]);
        print("data is not  avalabel");
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
    return false;
  }
}
