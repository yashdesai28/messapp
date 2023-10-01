import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:plate_planner/app/modules/sign/services/adduserapi.dart';

class VerificationController extends GetxController {
  //TODO: Implement VerificationController

  var flag = 0;

  Future<bool> verifiyotp(String otp, String verificationId, Map data) async {
    print("controler====" + otp);

    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: otp);
      // Sign the user in (or link) with the credential
      var chek = await auth.signInWithCredential(credential);

      print("chek  control");
      print("otp is verify and calling adduser api");
      print(data);
      flag=1;
      adduApi.adduser(data);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      print("not correct otp");
      return false;

      
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
