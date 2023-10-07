import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:plate_planner/app/data/secure_storage.dart';

import '../controllers/changepassword_controller.dart';

// class ChangepasswordView extends GetView<ChangepasswordController> {
//   const ChangepasswordView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ChangepasswordView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'ChangepasswordView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class ChangepasswordView extends StatefulWidget {
  const ChangepasswordView({super.key});

  @override
  State<ChangepasswordView> createState() => _ChangepasswordViewState();
}

class _ChangepasswordViewState extends State<ChangepasswordView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String conpass;

  late int p = 0;
  late int c = 0;
  late int pc = 0;

  void submitform() {
    if (formKey.currentState!.validate()) {
      //      print("valid");
    }
  }

  String? validatepasscu(value) {
    if (value!.isEmpty) {
      pc = 0;
      return 'Please Enter an Password';
    }
    RegExp passwordRegex = RegExp(r'^[a-zA-Z0-9]{5,9}$');
    if (!passwordRegex.hasMatch(value)) {
      pc = 0;
      return 'Please Enter a Valid Password Note 5 to 9 characters  \n , where each character is either a lowercase letter \n (a-z),  an uppercase letter (A-Z), or a digit (0-9).';
    }
    pc = 1;

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

  TextEditingController curr = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController conpassword = TextEditingController();

  bool passwordVisible = false;
  bool passwordVisiblep = false;
  bool passwordVisiblec = false;

  void initState() {
    super.initState();
    passwordVisible = true;
    passwordVisiblep = true;
    passwordVisiblec = true;

    print("initstae");

    lod();
  }

//String dropdownValue='';

  Future<void> lod() async {
    print("this is a lod");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(136, 74, 178, 1.000),
        appBar: AppBar(
          elevation: 0,
          title: Text("Change Password"),
          backgroundColor: Color.fromRGBO(136, 74, 178, 1.000),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios,
                  size: 20, color: const Color.fromARGB(255, 255, 255, 255))),
        ),
        resizeToAvoidBottomInset: true,
        body: Form(
          key: formKey,
          child: Container(
            //margin: EdgeInsets.symmetric(vertical: 90),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    height: 200,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/cpass.png'),
                        fit: BoxFit
                            .cover, // You can adjust the fit property as needed
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    //color: Colors.amber,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.values[4],
                      children: <Widget>[
                        Expanded(
                            child: Stack(children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 17, 17, 17),
                                    blurRadius: 20.0,
                                    spreadRadius: 3.0,
                                    offset: Offset(0.0, 0.0),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                )),
                          ),
                          Container(
                            height: 470,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "Change Password",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 40),
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                                obscureText: passwordVisible,
                                            controller: curr,
                                            decoration: InputDecoration(
                                                labelText: 'current-password',
                                                suffixIcon: IconButton(
                                                  icon: Icon(!passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off),
                                                  onPressed: () {
                                                    setState(
                                                      () {
                                                        passwordVisible =
                                                            !passwordVisible;
                                                      },
                                                    );
                                                  },
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0))),
                                            validator: validatepasscu),
                                        SizedBox(height: 25),
                                        TextFormField(
                                          controller: Password,
                                          obscureText: passwordVisiblep,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          decoration: InputDecoration(
                                              labelText: 'password',
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
                                                      BorderRadius.circular(
                                                          10.0))),
                                          validator: validatepass,
                                        ),
                                        SizedBox(height: 25),
                                        TextFormField(
                                          controller: conpassword,
                                          obscureText: passwordVisiblec,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          decoration: InputDecoration(
                                              labelText: 'confirm password',
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
                                                      BorderRadius.circular(
                                                          10.0))),
                                          validator: validateconpass,
                                        ),
                                        SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 40),
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
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: MaterialButton(
                                          minWidth: double.infinity,
                                          height: 60,
                                          onPressed: () async {
                                            submitform();

                                            if (p == 1 && c == 1) {
                                              print("validation is all ok");

                                              var pho = await securestorage()
                                                  .readsecurestorage(
                                                      'userlogin');

                                              var data = {
                                                "contact_number": pho,
                                                "hpassword": curr.text,
                                                "newpassword": conpassword.text
                                              };
                                              print({data});
                                              await ChangepasswordController
                                                  .uppass(data);
                                            } else {
                                              Get.snackbar(
                                                'Something Went Wrong ',
                                                'All Fields Must Be Filled While Signing Up',
                                                backgroundColor: Color.fromARGB(
                                                    255, 19, 19, 19),
                                                borderRadius: 25.0,
                                                margin: EdgeInsets.all(16.0),
                                                colorText: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                                snackPosition: SnackPosition
                                                    .TOP, // Adjust the position as needed
                                                duration: Duration(
                                                    seconds:
                                                        5), // Adjust the duration as needed
                                                overlayBlur: 4.0,
                                                overlayColor: Colors.black
                                                    .withOpacity(0.1),
                                                forwardAnimationCurve:
                                                    Curves.easeInOut,
                                                reverseAnimationCurve:
                                                    Curves.easeInOut,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                                color: const Color.fromARGB(
                                                    255, 248, 247, 247)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ])),
                      ],
                    ),
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
