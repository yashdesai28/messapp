import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_controller.dart';
import '../services/sapi.dart';


class SignView extends StatefulWidget {
  const SignView({super.key});

  @override
  State<SignView> createState() => _SignViewState();
}

class _SignViewState extends State<SignView> {
 
  var sController = Get.put(SignController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String conpass="";

  late int fn = 0;
  late int ln = 0;
  late int e = 0;
  late int p = 0;
  late int c = 0;
  late int phn = 0;

  void submitform() {
    if (formKey.currentState!.validate()) {
      //      print("valid");
    }
  }

  String? validateEmail(value) {
    if (value!.isEmpty) {
      e = 0;
      return 'Please Enter an Email';
    }
    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (!emailRegex.hasMatch(value)) {
      e = 0;
      return 'Please Enter a Valid Email';
    }
    e = 1;
    return null;
  }

  String? validatefname(value) {
    if (value!.isEmpty) {
      fn = 0;
      return 'Please Enter an First Name';
    }
    RegExp nameRegex = RegExp(r'^[a-zA-Z]+$');
    if (!nameRegex.hasMatch(value)) {
      fn = 0;
      return 'Please Enter a Valid First Name';
    }
    fn = 1;
    return null;
  }

  String? validatelname(value) {
    if (value!.isEmpty) {
      ln = 0;
      return 'Please Enter an Last Name';
    }
    RegExp nameRegex = RegExp(r'^[a-zA-Z]+$');
    if (!nameRegex.hasMatch(value)) {
      ln = 0;
      return 'Please Enter a Valid Last Name';
    }
    ln = 1;
    return null;
  }

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


  
  bool passwordVisiblep = false;
  bool passwordVisiblec = false;

  void initState() {
    super.initState();
    
    passwordVisiblep =true;
    passwordVisiblec = true;

    print("initstae");

    
  }

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController conpassword = TextEditingController();

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
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 60,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: <Widget>[
                          Text(
                            "Sign up ",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create an account, It's Free",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 70,
                        width: 310,
                        //color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 140,
                                child: TextFormField(
                                    controller: fname,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                        labelText: 'First Name',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))),
                                    validator: validatefname),
                              ),
                              SizedBox(
                                width: 140,
                                child: TextFormField(
                                    controller: lname,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                        labelText: 'Last Name',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))),
                                    validator: validatelname),
                              ),
                              // MakeInput(label: "Email"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: email,
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                validator: validateEmail),
                            SizedBox(height: 25),
                            TextFormField(
                              controller: phone,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  labelText: 'Phone-Number',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              validator: validatephone,
                            ),
                            SizedBox(height: 25),
                            TextFormField(
                              controller: Password,
                              obscureText: passwordVisiblep,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                                  icon: Icon(!passwordVisiblep
                                                      ? Icons.visibility
                                                      : Icons.visibility_off),
                                                  onPressed: () {
                                                    setState(
                                                      () {
                                                        passwordVisiblep =
                                                            !passwordVisiblep;
                                                      },
                                                    );
                                                  },
                                                ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              validator: validatepass,
                            ),
                            SizedBox(height: 25),
                            TextFormField(
                              controller: conpassword,
                              obscureText: passwordVisiblec,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  labelText: 'Confim Password',
                                  suffixIcon: IconButton(
                                                  icon: Icon(!passwordVisiblec
                                                      ? Icons.visibility
                                                      : Icons.visibility_off),
                                                  onPressed: () {
                                                    setState(
                                                      () {
                                                        passwordVisiblec =
                                                            !passwordVisiblec;
                                                      },
                                                    );
                                                  },
                                                ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              validator: validateconpass,
                            ),
                            SizedBox(height: 25),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff5D69BE),
                                    Color(0xffC89FEB)
                                  ], // Replace with your desired colors
                                ),
                                borderRadius: BorderRadius.circular(50)),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () async {
                                submitform();

                                if (fn == 1 &&
                                    ln == 1 &&
                                    e == 1 &&
                                    phn == 1 &&
                                    p == 1 &&
                                    c == 1) {
                                  print("validation is all ok");
                                  //sController.sendotp(phone.text.trim());
                                  //Get.toNamed('/verification');

                                  var data = {
                                    "fname": fname.text,
                                    "lname": lname.text,
                                    "email": email.text,
                                    "contact_number": phone.text,
                                    "hpassword": Password.text,
                                    "chpassword": conpassword.text
                                  };
                                  bool ack= await Api.adduser(data);
                                  if(!ack){

                                    Get.snackbar(
                                    'Something Went Wrong ',
                                    'data is avalabel',
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

                                } else {
                                  //Get.toNamed('/verification');
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
                                  print("validation is not ok ");
                                }
                              },
                              //color: Colors.greenAccent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                "Sign up ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/login');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Alread have an account?"),
                            Text(
                              "Login ",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
