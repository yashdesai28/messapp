import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:plate_planner/app/modules/hmenu/bindings/menumodel.dart';
import 'package:plate_planner/app/modules/hmenu/controllers/hmenu_controller.dart';

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
  HmenuController controller = Get.put(HmenuController());

  void initState() {
    super.initState();

    print("initstae");

    lod();
  }

  late List<Menudata> jsonData;
  String days = '';
  String Breakfast = '';
  String dinner = '';
  String lunch = '';

  Future<void> lod() async {
    jsonData = await controller.fetchmenudata();
    // Print the data
    jsonData.forEach((menu) {
      print('ID: ${menu.id}');
      print('Days: ${menu.days}');
      print('Breakfast: ${menu.breakfast}');
      print('Lunch: ${menu.lunch}');
      print('Dinner: ${menu.dinner}');
      print('Version: ${menu.v}');
      print('-------------------');
      setState(() {
        Breakfast = menu.breakfast;
        lunch = menu.lunch;
        dinner = menu.dinner;
        days = menu.days;
      });
    });
    print("bre$Breakfast");
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    // Format the date as a string
    String formattedDate =
        "${currentDate.day}-${currentDate.month}-${currentDate.year}";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(42, 157, 143, 1.000),
      appBar: AppBar(
        elevation: 0,
        title: Text("Menu"),
        // titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
        backgroundColor: Color.fromRGBO(42, 157, 143, 1.000),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
                size: 20, color: const Color.fromARGB(255, 255, 255, 255))),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Stack(children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 180,
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
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 420,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 530,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            //color: Color.fromARGB(255, 215, 117, 117),
                            child: Column(
                              children: [
                                Text(
                                  '$days',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 146, 39, 10),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('$formattedDate',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Text("_____________________"),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            //color: const Color.fromARGB(255, 216, 166, 166),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Lunch",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 146, 39, 10),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("_____________________"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '$lunch',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            )),
                      ],
                    ),

                    //color: Colors.amber,
                  ),
                ],
              )
            ])),
            
            Container(
              margin: EdgeInsets.only(bottom: 17),
              width: 310,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 17, 17, 17),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffEE0A67),
                      Color(0xffFEA1BE),
                    ], // Replace with your desired colors
                  ),
                  borderRadius: BorderRadius.circular(50)),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: Text(
                  "Pay ₹50",
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
