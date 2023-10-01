import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gmenu_controller.dart';

// class GmenuView extends GetView<GmenuController> {
//   const GmenuView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('GmenuView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'GmenuView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class GmenuView extends StatefulWidget {
  const GmenuView({super.key});

  @override
  State<GmenuView> createState() => _GmenuViewState();
}

class _GmenuViewState extends State<GmenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(136, 74, 178, 1.000),
      appBar: AppBar(
        elevation: 0,
        title: Text("Menu"),
        // titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
        backgroundColor: Color.fromRGBO(136, 74, 178, 1.000),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
                size: 20, color: const Color.fromARGB(255, 255, 255, 255))),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 550,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 17, 17, 17),
                      blurRadius: 25.0,
                      spreadRadius: 4.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                  image: DecorationImage(
                      image: AssetImage('assets/MENU.jpg'), fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
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
                                        Get.toNamed('/login');
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
          ],
        ),
      ),
    );
  }
}
