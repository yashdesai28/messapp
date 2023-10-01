import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:plate_planner/app/modules/forgotpass/controllers/verify.dart';
import '../controllers/verification_controller.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _OtpState();
}

class _OtpState extends State<VerificationView> {
  var vVerificationController = Get.put(VerificationController());
  var forgetpassController = Get.put(Verifypass());

  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;

  String _code = '';

  int _start = 60;
  int _currentIndex = 0;
  Timer? _timer; // Declare the timer as an instance variable

  @override
  void initState() {
    // super.initState();
    _isResendAgain = true;
    _startTimer();
  }

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 60;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Cancel the timer in the dispose method
    _timer?.cancel();
  }

// Rest of your widget code
  var one = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black)),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9),
        height: MediaQuery.of(context).size.height / 1,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 285,
              height: 285,
              child: Center(child: Image(image: AssetImage('assets/otp.png'))),
            ),
            Text(
              "Verification",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              //${one[1]["contact_number"]}
              'Please Enter The 6 Digit Code Sent To \n +91 ${one[1]["contact_number"]} ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, color: Colors.grey.shade500, height: 1.5),
            ),
            VerificationCode(
              length: 6,
              textStyle: TextStyle(fontSize: 20),
              underlineColor: Colors.blue,
              keyboardType: TextInputType.number,
              onCompleted: (value) async {
                print(value);
                print(one[0]);
                print(one[1]);

                if (one[2] == 0) {
                  print(one[1]);
                  print("request sending a forget password");

                  bool ack = await forgetpassController.verifiyotppass(value, one[0], one[1]);
                  if (ack == false) {
                    Get.snackbar(
                      'Something Went Wrong ',
                      'Wrong otp',
                      backgroundColor: Color.fromARGB(255, 19, 19, 19),
                      borderRadius: 25.0,
                      margin: EdgeInsets.all(16.0),
                      colorText: const Color.fromARGB(255, 255, 255, 255),
                      snackPosition:
                          SnackPosition.TOP, // Adjust the position as needed
                      duration:
                          Duration(seconds: 5), // Adjust the duration as needed
                      overlayBlur: 4.0,
                      overlayColor: Colors.black.withOpacity(0.1),
                      forwardAnimationCurve: Curves.easeInOut,
                      reverseAnimationCurve: Curves.easeInOut,
                      animationDuration: Duration(milliseconds: 500),
                      mainButton: TextButton(
                        onPressed: () {
                          Get.back(); // Close the snackbar
                        },
                        child: Text(
                          'Dismiss',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }

                } else {
                  print("request sending a sign user");
                  bool ack = await vVerificationController.verifiyotp(
                      value, one[0], one[1]);
                  if (ack == false) {
                    Get.snackbar(
                      'Something Went Wrong ',
                      'Wrong otp',
                      backgroundColor: Color.fromARGB(255, 19, 19, 19),
                      borderRadius: 25.0,
                      margin: EdgeInsets.all(16.0),
                      colorText: const Color.fromARGB(255, 255, 255, 255),
                      snackPosition:
                          SnackPosition.TOP, // Adjust the position as needed
                      duration:
                          Duration(seconds: 5), // Adjust the duration as needed
                      overlayBlur: 4.0,
                      overlayColor: Colors.black.withOpacity(0.1),
                      forwardAnimationCurve: Curves.easeInOut,
                      reverseAnimationCurve: Curves.easeInOut,
                      animationDuration: Duration(milliseconds: 500),
                      mainButton: TextButton(
                        onPressed: () {
                          Get.back(); // Close the snackbar
                        },
                        child: Text(
                          'Dismiss',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }
                }
              },
              onEditing: (value) {},
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't recieve the SMS?",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                ),
                TextButton(
                    onPressed: () {
                      if (_isResendAgain) return;
                      initState();
                    },
                    child: Text(
                      _isResendAgain
                          ? "try again in " + _start.toString()
                          : "Resend",
                      style: TextStyle(color: Colors.blueAccent),
                    ))
              ],
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff5D69BE),
                    Color(0xffC89FEB)
                  ], // Replace with your desired colors
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(50), // Same radius as the Container
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.purple,
                  minWidth: double.infinity,
                  height: 50,
                  child: Text(
                    "Verify",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
