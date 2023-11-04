import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:plate_planner/app/data/secure_storage.dart';

import '../controllers/hattendance_controller.dart';

// class HattendanceView extends GetView<HattendanceController> {
//   const HattendanceView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HattendanceView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'HattendanceView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class HattendanceView extends StatefulWidget {
  const HattendanceView({super.key});

  @override
  State<HattendanceView> createState() => _HattendanceViewState();
}

class _HattendanceViewState extends State<HattendanceView> {
  HattendanceController hattendanceController =
      Get.put(HattendanceController());
  // bool isChecked = false;
  List<bool> isCheckedList = [false, false, false];

  void initState() {
    super.initState();

    print("initstae");

    lod();
  }

  Future<void> lod() async {
    DateTime currentDate = DateTime.now();

    // Format the date as a string
    String formattedDate =
        "${currentDate.day}/${currentDate.month}/${currentDate.year}";
    var sec = await securestorage().readmealsdata('bookmeals');
    
    print(sec);
    print(formattedDate);

    if (sec == formattedDate) {
      print("match");
      securestorage().deletemealsdata('bookmeals');
    } else {
      
      Get.toNamed('/qrcode');
    }

    print(sec);
    print(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();

    // Get the next day
    DateTime nextDay = currentDate.add(Duration(days: 1));

    // Format the dates
    String currentFormatted =
        "${currentDate.year}-${currentDate.month}-${currentDate.day}";
    String formattedDate = "${nextDay.day}-${nextDay.month}-${nextDay.year}";

    print("Current date: $currentFormatted");
    print("Next day and date: $formattedDate");

    return Scaffold(
      backgroundColor: Color.fromRGBO(136, 74, 178, 1.000),
      appBar: AppBar(
        elevation: 0,
        title: Text("attendance"),
        // titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
        backgroundColor: Color.fromRGBO(136, 74, 178, 1.000),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
                size: 20, color: const Color.fromARGB(255, 255, 255, 255))),
      ),
      body: Form(
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
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/wast.jpg'),
                        fit: BoxFit
                            .fitHeight, // You can adjust the fit property as needed
                      ),
                    ),
                  ),
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
                            height: MediaQuery.of(context).size.height - 350,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 17, 17, 17),
                                    blurRadius: 25.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(7.0, 7.0),
                                  ),
                                ],
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                )),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  //margin: EdgeInsets.only(right: 100),
                                  //padding: EdgeInsets.only(left: 30),
                                  //color: Colors.amber,
                                  child: Column(
                                    children: <Widget>[
                                      Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Avoid Food Wastage",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Food is gift.Let's Work together to ensure that every mouth is fed and no food goes to waste",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10, top: 10),
                                            child: Column(
                                              children: [
                                                Text(
                                                  '$formattedDate',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 10, top: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                                "Check if you are absent for following",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            checkColor: Colors.white,
                                            value: isCheckedList[0],
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isCheckedList[0] = value!;
                                              });
                                            },
                                          ),
                                          Text(
                                              "Not Having BREAKFAST today (Morning)")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            checkColor: Colors.white,
                                            value: isCheckedList[1],
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isCheckedList[1] = value!;
                                              });
                                            },
                                          ),
                                          Text(
                                              "Not Having LUNCH today (Afternoon)")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            checkColor: Colors.white,
                                            value: isCheckedList[2],
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isCheckedList[2] = value!;
                                                print(isCheckedList[2]);
                                              });
                                            },
                                          ),
                                          Text(
                                              "Not Having DINNER today (Night)")
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
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
                                      borderRadius: BorderRadius.circular(50)),
                                  child: MaterialButton(
                                    minWidth: double.infinity,
                                    height: 60,
                                    onPressed: () {
                                      hattendanceController
                                          .bookedmeals(isCheckedList);
                                    },
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
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
