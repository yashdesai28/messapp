import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../services/loginapi.dart';

// class LoginView extends GetView<LoginController> {
//   LoginView({Key? key}) : super(key: key);

//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   late String conpass;

//   late int e = 0;
//   late int p = 0;

//   late int phn = 0;

//   void submitform() {
//     if (formKey.currentState!.validate()) {
//       //      print("valid");
//     }
//   }

//   String? validateEmail(value) {
//     if (value!.isEmpty) {
//       e = 0;
//       return 'Please Enter an Email';
//     }
//     RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
//     if (!emailRegex.hasMatch(value)) {
//       e = 0;
//       return 'Please Enter a Valid Email';
//     }
//     e = 1;
//     return null;
//   }

//   String? validatephone(value) {
//     if (value!.isEmpty) {
//       phn = 0;
//       return 'Please Enter an Phone-Number';
//     }
//     RegExp phoneRegex = RegExp(r'^[789]\d{9}$');
//     if (!phoneRegex.hasMatch(value)) {
//       phn = 0;
//       return 'Please Enter a Valid Phone-Number';
//     }
//     phn = 1;
//     return null;
//   }

//   String? validatepass(value) {
//     if (value!.isEmpty) {
//       p = 0;
//       return 'Please Enter an Password';
//     }
//     // RegExp passwordRegex=RegExp(r'^[a-zA-Z0-9]{5,9}$');
//     // if(!passwordRegex.hasMatch(value))
//     // {p=0;
//     //   return 'Please Enter a Valid Password Note 5 to 9 characters  \n , where each character is either a lowercase letter \n (a-z),  an uppercase letter (A-Z), or a digit (0-9).';
//     // }
//     p = 1;
//     // conpass=value;
//     return null;
//   }

//   //TextEditingController email = TextEditingController();
//   TextEditingController phone = TextEditingController();
//   TextEditingController Password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black)),
//       ),
//       body: Form(
//         key: formKey,
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: <Widget>[
//                         Text(
//                           "Login",
//                           style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Text(
//                           "Login to your account",
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 40),
//                       child: Column(
//                         children: <Widget>[
//                           TextFormField(
//                               keyboardType: TextInputType.phone,
//                               autovalidateMode:
//                                   AutovalidateMode.onUserInteraction,
//                               controller: phone,
//                               decoration: InputDecoration(
//                                   labelText: 'Phone-Number',
//                                   border: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(10.0))),
//                               validator: validatephone),
//                           SizedBox(height: 20),
//                           TextFormField(
//                             controller: Password,
//                             autovalidateMode:
//                                 AutovalidateMode.onUserInteraction,

//                             decoration: InputDecoration(
//                                 labelText: 'Password',
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0))),
//                             validator: validatepass,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 7,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 40),
//                       child: Container(
//                         padding: EdgeInsets.only(top: 3, left: 3),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                                 colors: [
//                                   Color(0xff5D69BE),
//                                   Color(0xffC89FEB)
//                                 ], // Replace with your desired colors
//                               ),
//                               borderRadius: BorderRadius.circular(50)),
//                           child: MaterialButton(
//                             minWidth: double.infinity,
//                             height: 60,
//                             onPressed: () async {
//                               submitform();
//                               if (phn == 1 && p == 1) {
//                                 print("validation is all ok");
//                                 var data = {
//                                   "contact_number": phone.text.trim(),
//                                   "hpassword": Password.text.trim(),
//                                 };

//                                 bool ack = await lApi.adduser(data);

//                                 print(ack);

//                                 if (!ack) {
//                                   Get.snackbar(
//                                     'Something Went Wrong ',
//                                     'data is not  avalabel',
//                                     backgroundColor:
//                                         Color.fromARGB(255, 19, 19, 19),
//                                     borderRadius: 25.0,
//                                     margin: EdgeInsets.all(16.0),
//                                     colorText: const Color.fromARGB(
//                                         255, 255, 255, 255),
//                                     snackPosition: SnackPosition
//                                         .TOP, // Adjust the position as needed
//                                     duration: Duration(
//                                         seconds:
//                                             5), // Adjust the duration as needed
//                                     overlayBlur: 4.0,
//                                     overlayColor: Colors.black.withOpacity(0.1),
//                                     forwardAnimationCurve: Curves.easeInOut,
//                                     reverseAnimationCurve: Curves.easeInOut,
//                                     animationDuration:
//                                         Duration(milliseconds: 500),
//                                     mainButton: TextButton(
//                                       onPressed: () {
//                                         Get.back(); // Close the snackbar
//                                       },
//                                       child: Text(
//                                         'Dismiss',
//                                         style: TextStyle(
//                                           color: Colors.blue,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 }
//                               } else {
//                                 Get.snackbar(
//                                   'Something Went Wrong ',
//                                   'All Fields Must Be Filled While Signing Up',
//                                   backgroundColor:
//                                       Color.fromARGB(255, 19, 19, 19),
//                                   borderRadius: 25.0,
//                                   margin: EdgeInsets.all(16.0),
//                                   colorText:
//                                       const Color.fromARGB(255, 255, 255, 255),
//                                   snackPosition: SnackPosition
//                                       .TOP, // Adjust the position as needed
//                                   duration: Duration(
//                                       seconds:
//                                           5), // Adjust the duration as needed
//                                   overlayBlur: 4.0,
//                                   overlayColor: Colors.black.withOpacity(0.1),
//                                   forwardAnimationCurve: Curves.easeInOut,
//                                   reverseAnimationCurve: Curves.easeInOut,
//                                   animationDuration:
//                                       Duration(milliseconds: 500),
//                                   mainButton: TextButton(
//                                     onPressed: () {
//                                       Get.back(); // Close the snackbar
//                                     },
//                                     child: Text(
//                                       'Dismiss',
//                                       style: TextStyle(
//                                         color: Colors.blue,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                                 print("validation is not ok ");
//                               }
//                             },
//                             elevation: 0,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50)),
//                             child: Text(
//                               "Login",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 18,
//                                 //color: Colors.black
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 7,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Get.toNamed('/forgotpass');
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             "forgot password",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 18,
//                               color: Colors.blue,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Get.toNamed('/sign');
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text("Don't have an account?"),
//                           Text(
//                             "Sign up",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 18,
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 height: MediaQuery.sizeOf(context).height / 2.7,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/logos.png'),
//                         fit: BoxFit.cover)),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget MakeInput({label, obscureText = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.w400,
//             color: Colors.black87,
//           ),
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         TextField(
//           obscureText: obscureText,
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//             enabledBorder:
//                 OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//             border:
//                 OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//           ),
//         ),
//         SizedBox(
//           height: 30,
//         )
//       ],
//     );
//   }
// }

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String conpass;

  late int e = 0;
  late int p = 0;

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
    // RegExp passwordRegex=RegExp(r'^[a-zA-Z0-9]{5,9}$');
    // if(!passwordRegex.hasMatch(value))
    // {p=0;
    //   return 'Please Enter a Valid Password Note 5 to 9 characters  \n , where each character is either a lowercase letter \n (a-z),  an uppercase letter (A-Z), or a digit (0-9).';
    // }
    p = 1;
    // conpass=value;
    return null;
  }

  //TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                          "Login",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Login to your account",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              keyboardType: TextInputType.phone,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: phone,
                              decoration: InputDecoration(
                                  labelText: 'Phone-Number',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              validator: validatephone),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: Password,
                            obscureText: passwordVisible,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: IconButton( 
                      icon: Icon(!passwordVisible 
                          ? Icons.visibility 
                          : Icons.visibility_off), 
                      onPressed: () { 
                        setState( 
                          () { 
                            passwordVisible = !passwordVisible; 
                          }, 
                        ); 
                      }, 
                    ), 
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            validator: validatepass,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
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
                              if (phn == 1 && p == 1) {
                                print("validation is all ok");
                                var data = {
                                  "contact_number": phone.text.trim(),
                                  "hpassword": Password.text.trim(),
                                };

                                bool ack = await lApi.adduser(data);

                                print(ack);

                                if (!ack) {
                                  Get.snackbar(
                                    'Something Went Wrong ',
                                    'data is not  avalabel',
                                    backgroundColor:
                                        Color.fromARGB(255, 19, 19, 19),
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
                                Get.snackbar(
                                  'Something Went Wrong ',
                                  'All Fields Must Be Filled While Signing Up',
                                  backgroundColor:
                                      Color.fromARGB(255, 19, 19, 19),
                                  borderRadius: 25.0,
                                  margin: EdgeInsets.all(16.0),
                                  colorText:
                                      const Color.fromARGB(255, 255, 255, 255),
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
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                //color: Colors.black
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/forgotpass');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "forgot password",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/sign');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account?"),
                          Text(
                            "Sign up",
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
              Container(
                height: MediaQuery.sizeOf(context).height / 2.7,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logos.png'),
                        fit: BoxFit.cover)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget MakeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
