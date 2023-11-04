import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';

// class ChangePasswordView extends GetView<ChangePasswordController> {
//   const ChangePasswordView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ChangePasswordView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'ChangePasswordView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void submitform() {
    if (formKey.currentState!.validate()) {
      //      print("valid");
    }
  }

  late String conpass="";

  late int p = 0;
  late int c = 0;

  String? validatepass(value) {
    if (value!.isEmpty) {
      p = 0;
      return 'Please Enter an Password';
    }
    RegExp passwordRegex = RegExp(r'^[a-zA-Z0-9]{5,9}$');
    if (!passwordRegex.hasMatch(value)) {
      p = 0;
      return 'Please Enter a Valid Password Note 5 to 9 characters  \n , where each character is either a lowercase letter \n (a-z),  an uppercase letter (A-Z), or a digit (0-9).';
    }
    p = 1;
    conpass = value;
    return null;
  }

  String? validateconpass(value) {
    if (value!.isEmpty) {
      c = 0;
      return 'Please Enter an Confim Password';
    }

    if (conpass != value) {
      c = 0;
      return 'Please Enter a correct Confim Password';
    }
    c = 1;
    return null;
  }

  TextEditingController Password = TextEditingController();
  TextEditingController conpassword = TextEditingController();

  bool passwordVisiblep = false;
  bool passwordVisiblec = false;

  void initState() {
    super.initState();

    passwordVisiblep = true;
    passwordVisiblec = true;

    print("initstae");
  }

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
                controller: Password,
                      obscureText: passwordVisiblep,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(!passwordVisiblep
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisiblep = !passwordVisiblep;
                          },
                        );
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                validator: validatepass,
              ),
              SizedBox(height: 25),
              TextFormField(
                controller: conpassword,
                      obscureText: passwordVisiblec,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    labelText: 'Confim Password',
                    suffixIcon: IconButton(
                      icon: Icon(!passwordVisiblec
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisiblec = !passwordVisiblec;
                          },
                        );
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                validator: validateconpass,
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
                    onPressed: () {
                      if (p == 1 && c == 1) {
                        print("validation is all ok");
                        //sController.sendotp(phone.text.trim());
                        //Get.toNamed('/verification');

                        var data = {
                          "contact_number": Get.arguments,
                          "hpassword": Password.text,
                          "chpassword": conpassword.text
                        };
                        print(Get.arguments);
                        ChangePasswordController.updatepassword(data);
                      } else {
                        //Get.toNamed('/verification');
                        Get.snackbar(
                          "",
                          "",
                          titleText: Text(
                            "somthing worng",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          messageText: Text("meassage proper",
                              style: TextStyle(color: Colors.white)),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.black,
                          forwardAnimationCurve: Curves.bounceInOut,
                          margin: EdgeInsets.all(10),
                        );
                        print("validation is not ok ");
                      }
                    },
                    child: Text("Update")),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
