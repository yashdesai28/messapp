import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hmenu_controller.dart';

// class HmenuView extends GetView<HmenuController> {
//   const HmenuView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HmenuView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'HmenuView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class HmenuView extends StatefulWidget {
  const HmenuView({super.key});

  @override
  State<HmenuView> createState() => _HmenuViewState();
}

class _HmenuViewState extends State<HmenuView> {
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
              height: 610,
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
          ],
        ),
      ),
    );
  }
}
