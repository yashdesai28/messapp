import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:plate_planner/app/modules/mhdash/views/mhdash_view.dart';
import 'package:plate_planner/app/modules/mhuser/views/mhuser_view.dart';
import 'package:plate_planner/app/modules/qrscanner/views/qrscanner_view.dart';

import '../controllers/messmainhom_controller.dart';

// class MessmainhomView extends GetView<MessmainhomController> {
//   const MessmainhomView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MessmainhomView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'MessmainhomView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class MessmainhomView extends StatefulWidget {
  const MessmainhomView({super.key});

  @override
  State<MessmainhomView> createState() => _MessmainhomViewState();
}

class _MessmainhomViewState extends State<MessmainhomView> {
 final MessmainhomController controller = Get.put(MessmainhomController());

  void initState() {
    super.initState();
    controller.onInit();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: PageView(
        onPageChanged: controller.gotopage,
        controller: controller.pageController,
        children: [MhdashView(),MhuserView(),QrscannerView()],
      ),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('Fname: ${datauser[0].guestFname}'),
      //       Text('Lname:${datauser[0].guestLname}'),
      //       Text('email:${datauser[0].guestEmail}'),
      //       Text('phone:${datauser[0].guestContactNumber}'),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: Container(
        height: 80,
        //margin: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        // margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            boxShadow: [
              BoxShadow(
                color: Color(0xffDDDDDD),
                blurRadius: 6.0,
                spreadRadius: 2.0,
                offset: Offset(0.0, 0.0),
              )
            ],
            borderRadius: BorderRadius.circular(0)),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _bottomAppBarItem(context, icon: 'assets/house.png', page: 0),
              _bottomAppBarItem(context, icon: 'assets/user.png', page: 1),
              _bottomAppBarItem(context, icon: 'assets/codescan.png', page: 2),
              _bottomAppBarItem(context, icon: 'assets/app.png', page: 3)
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required String icon, required page}) {
    return Center(
      child: GestureDetector(
        onTap: () => controller.gototab(
            page), // Assuming controller is defined and contains a method gotoTab
        child: Container(
          height: 65,
          width: 65,
          // decoration: BoxDecoration(
          //   color: controller.currentpage.value == page
          //       ? Color.fromRGBO(105, 4, 105, 1)
          //       : Color.fromRGBO(255, 255, 255, 1),
          //   borderRadius: BorderRadius.circular(0),
          // ),
          child: Center(
            child: Container(
              height: 34, // Set the height to match the outer container
              width: 34, // Set the desired width
              //color: Color.fromRGBO(105, 81, 4, 1),
              child: Image.asset(
                icon,
                color: controller.currentpage.value == page
                    ? Color.fromRGBO(196, 11, 153, 1)
                    : Color.fromARGB(255, 22, 3, 80),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
