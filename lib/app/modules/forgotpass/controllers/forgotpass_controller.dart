import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ForgotpassController extends GetxController {
  //TODO: Implement ForgotpassController


  Future<void> sendotp(String phone) async {

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

          
                                      var data={
                                        "contact_number":phone,
                                        
                                      };
          
          Get.toNamed('/verification',arguments: [verify,data,0]);
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
