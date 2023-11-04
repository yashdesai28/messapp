import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:plate_planner/app/modules/menucard/views/menucard_view.dart';

import '../controllers/messmenu_controller.dart';

// class MessmenuView extends GetView<MessmenuController> {
//   const MessmenuView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MessmenuView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'MessmenuView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class MessmenuView extends StatefulWidget {
  const MessmenuView({super.key});

  @override
  State<MessmenuView> createState() => _MessmenuViewState();
}

class _MessmenuViewState extends State<MessmenuView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: PageView(
          children: [
            mondaymenu(),
            Tuesday(),
            wednesday(),
            Thursday(),
            friday(),
            saturday()
          ],
        ),
      ),
    );
  }
}
