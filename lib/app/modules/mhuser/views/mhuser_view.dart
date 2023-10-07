import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:plate_planner/app/data/secure_storage.dart';

import '../controllers/mhuser_controller.dart';

// class MhuserView extends GetView<MhuserController> {
//   const MhuserView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MhuserView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'MhuserView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class MhuserView extends StatefulWidget {
  const MhuserView({super.key});

  @override
  State<MhuserView> createState() => _MhuserViewState();
}

class _MhuserViewState extends State<MhuserView> {
 
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  MhuserController userController = Get.put(MhuserController());

  late String conpass;

  late int fn = 0;
  late int ln = 0;
  late int e = 0;

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

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  void initState() {
    super.initState();

    print("initstae");

    lod();
  }

  String pho = '';
  Future<void> lod() async {
    await userController.onInit();
    fname.text = userController.fnamer.value;
    lname.text = userController.lname;
    email.text = userController.email;
    phone.text = userController.phoneNumber;
    print("this is a lod");

    pho = await securestorage().readsecurestorage('userlogin');
    if (pho == 'No Data') {
      Get.toNamed('/home');
    } else {
      print("ok chek login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{ return false; },
      child: Scaffold(
        backgroundColor:Color.fromRGBO(119, 32, 107, 1),
        resizeToAvoidBottomInset: true,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              //margin: EdgeInsets.symmetric(vertical: 90),
              height: MediaQuery.of(context).size.height - 60,
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
                          image: AssetImage('assets/profile.png'),
                          fit: BoxFit
                              .fitHeight, // You can adjust the fit property as needed
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //color: Colors.amber,
                      height: MediaQuery.of(context).size.height ,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.values[4],
                        children: <Widget>[
                          Expanded(
                              child: Stack(children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  )),
                            ),
                            Container(
                              height: 427,
                              //color: Colors.amber,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "User profile ",
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 70,
                                      width: 310,
                                      //color: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 140,
                                              child: TextFormField(
                                                  controller: fname,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  decoration: InputDecoration(
                                                      labelText: 'First Name',
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0))),
                                                  validator: validatefname),
                                            ),
                                            SizedBox(
                                              width: 140,
                                              child: TextFormField(
                                                  controller: lname,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  decoration: InputDecoration(
                                                      labelText: 'Last Name',
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0))),
                                                  validator: validatelname),
                                            ),
                                            // MakeInput(label: "Email"),
                                          ],
                                        ),
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
                                              controller: email,
                                              decoration: InputDecoration(
                                                  labelText: 'Email',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0))),
                                              validator: validateEmail),
                                          SizedBox(height: 25),
                                          TextFormField(
                                            controller: phone,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            decoration: InputDecoration(
                                                labelText: 'Phone-Number',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0))),
                                            validator: validatephone,
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
    
                                              if (fn == 1 &&
                                                  ln == 1 &&
                                                  e == 1 &&
                                                  phn == 1) {
                                                print("validation is all ok");
    
                                                var data = {
                                                  "fname": fname.text,
                                                  "lname": lname.text,
                                                  "email": email.text,
                                                  "contact_number": phone.text,
                                                };
                                                // bool ack= await Api.adduser(data);
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
                                              "Edit profile ",
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
                                    Container(
                                      width: 320,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xff2A2B2A),
                                              Color(0xff9CEBB3)
                                            ], // Replace with your desired colors
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: MaterialButton(
                                        minWidth: double.infinity,
                                        height: 60,
                                        onPressed: () {
                                          securestorage()
                                              .deletesecurestorage('userlogin');
                                          Get.toNamed('/home');
                                        },
                                        child: Text(
                                          "Log Out",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: 310,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xffFB5037),
                                              Color(0xffE02873)
                                            ], // Replace with your desired colors
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: MaterialButton(
                                        minWidth: double.infinity,
                                        height: 60,
                                        onPressed: () {
                                          Get.toNamed('/changepassword');
                                        },
                                        child: Text(
                                          "change   password",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
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
      ),
    );
  }
}
