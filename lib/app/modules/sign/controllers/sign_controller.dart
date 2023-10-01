import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SignController extends GetxController {
  //TODO: Implement SignController

  Future<void> sendotp(String phone,Map data) async {

    print("phone number===================="+phone);
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 ${phone}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            // ignore: avoid_print
            print('The provided phone number is not valid.');
          } else {
            // ignore: avoid_print
            print(e.code);
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          final verify = verificationId;
          print("id=========== "+verify);
          print(data);
          Get.toNamed('/verification',arguments: [verify,data,1]);
          // Navigator.of(context).pop();

        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      debugPrint(e.toString());
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
