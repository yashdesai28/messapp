import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hhome_controller.dart';

// class HhomeView extends GetView<HhomeController> {
//   const HhomeView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HhomeView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'HhomeView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }


class HhomeView extends StatefulWidget {
  const HhomeView({super.key});

  @override
  State<HhomeView> createState() => _HhomeViewState();
}

class _HhomeViewState extends State<HhomeView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{ return false;},
      child: Scaffold(
        backgroundColor: Color.fromRGBO(136,74,178,1.000),
        appBar: AppBar(
          elevation: 0,
          title: Text("Dashboard"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(136,74,178,1.000),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 60,
            child: Column(
              children: <Widget>[
                Container(
                  //height: MediaQuery.of(context).size.height - 60,
                  //width: double.infinity,
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        border: InputBorder.none,
                        hintText: 'Search',
                        contentPadding: EdgeInsets.all(14),
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 492,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                          child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                )),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/hmenu');
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 25, right: 25),
                                    //color: Colors.redAccent,
                                    height: 260,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 260,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(255, 17, 17, 17), 
                                                    blurRadius: 25.0,
                                                    spreadRadius: 1.0,
                                                    offset: Offset(7.0, 7.0),
                                                  ),
                                                  
                                                ],
                                            image: DecorationImage(
                                                image:
                                                    AssetImage('assets/foodtime.jpg'),
                                                fit: BoxFit.fill),
                                            borderRadius: BorderRadius.circular(22),
                                            color: Colors.amberAccent,
                                            // You can add image decoration here if needed
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                      height: 30,
                                    ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/hattendance');
                              },
                              child: Container(
                                margin: EdgeInsets.all(25),
                                //color: Colors.redAccent,
                                height: 260,
                                child: Column(
                                  children: <Widget>[
                                    
                                    
                                    Container(
                                      height: 260,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(255, 17, 17, 17), 
                                                    blurRadius: 25.0,
                                                    spreadRadius: 1.0,
                                                    offset: Offset(7.0, 7.0),
                                                  ),
                                                  
                                                ],
                                        image: DecorationImage(
                                            image: AssetImage('assets/att.jpg'),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.circular(22),
                                        color: const Color.fromARGB(
                                            255, 226, 212, 158),
                                        // You can add image decoration here if needed
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                              ],
                            ),
                          ),
                          
    
                          // Container(
                          //   margin: EdgeInsets.all(20),
                          //   color: Colors.redAccent,
                          //   height: 200,
                          // )
                        ],
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
