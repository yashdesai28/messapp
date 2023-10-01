import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:plate_planner/app/modules/sign/services/adduserapi.dart';

class Verifypass extends GetxController {
  //TODO: Implement VerificationController

  Future<bool> verifiyotppass(String otp, String verificationId,Map data) async {
    print("controler====" + otp);

    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: otp);
      // Sign the user in (or link) with the credential
      var chek = await auth.signInWithCredential(credential);

      String phone= data["contact_number"];

      print("chek  control");
      print("otp is verify and calling chang password api");
      print("verify phone"+phone);
      Get.toNamed('/change-password',arguments: phone);
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
