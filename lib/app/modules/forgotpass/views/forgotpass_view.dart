import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgotpass_controller.dart';
import '../services/changpass.dart';

// class ForgotpassView extends GetView<ForgotpassController> {
//   const ForgotpassView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ForgotpassView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'ForgotpassView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class ForgotpassView extends StatefulWidget {
  const ForgotpassView({super.key});

  @override
  State<ForgotpassView> createState() => _ForgotpassViewState();
}

class _ForgotpassViewState extends State<ForgotpassView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late int phn = 0;

  String? validatephone(value) {
    if (value!.isEmpty) {
      phn = 0;
      return 'Please Enter an Phone-Number';
    }
    RegExp phoneRegex = RegExp(r'^[789]\d{9}$');
    if (!phoneRegex.hasMatch(value)) {
      phn = 0;
      return 'Please Enter a Valid Phone-Number';
    }
    phn = 1;
    return null;
  }

  TextEditingController phone = TextEditingController();
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
      body: Container(
        key: formKey,
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/fphone.jpg',
                width: 250,
                height: 250,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                            controller: phone,
                            keyboardType: TextInputType.phone,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(labelText: 'Phone-Number',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                            validator: validatephone,
                            
                          ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () async {

                      if(phn==1){
                                  print("validation is all ok");
                                      //sController.sendotp(phone.text.trim());
                                      //Get.toNamed('/verification');

                                      var data={
                                        "contact_number":phone.text,
                                      };
                                      bool ack = await forpassApi.password(data);
                                      print(ack);
                                      
                                      if(!ack){
                                        Get.snackbar(
                                    'Something Went Wrong ',
                                    'phone number is not avalabel',
                                    backgroundColor: Color.fromARGB(255, 19, 19, 19),
                                    borderRadius: 25.0,
                                    margin: EdgeInsets.all(16.0),
                                    colorText: const Color.fromARGB(255, 255, 255, 255),
                                    snackPosition: SnackPosition
                                        .TOP, // Adjust the position as needed
                                    duration: Duration(
                                        seconds:
                                            5), // Adjust the duration as needed
                                    overlayBlur: 4.0,
                                    overlayColor: Colors.black.withOpacity(0.1),
                                    forwardAnimationCurve: Curves.easeInOut,
                                    reverseAnimationCurve: Curves.easeInOut,
                                    animationDuration:
                                        Duration(milliseconds: 500),
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
                                else{
                                  Get.snackbar(
                                    'Something Went Wrong ',
                                    'All Fields Must Be Filled While Signing Up',
                                    backgroundColor: Color.fromARGB(255, 19, 19, 19),
                                    borderRadius: 25.0,
                                    margin: EdgeInsets.all(16.0),
                                    colorText: const Color.fromARGB(255, 255, 255, 255),
                                    snackPosition: SnackPosition
                                        .TOP, // Adjust the position as needed
                                    duration: Duration(
                                        seconds:
                                            5), // Adjust the duration as needed
                                    overlayBlur: 4.0,
                                    overlayColor: Colors.black.withOpacity(0.1),
                                    forwardAnimationCurve: Curves.easeInOut,
                                    reverseAnimationCurve: Curves.easeInOut,
                                    animationDuration:
                                        Duration(milliseconds: 500),
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
                    },
                    child: Text("Send the code")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
