import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:plate_planner/app/data/secure_storage.dart';

import '../controllers/mhdash_controller.dart';

// class MhdashView extends GetView<MhdashController> {
//   const MhdashView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MhdashView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'MhdashView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class MhdashView extends StatefulWidget {
  const MhdashView({super.key});

  @override
  State<MhdashView> createState() => _MhdashViewState();
}

class _MhdashViewState extends State<MhdashView> {
  
  void initState() {
    super.initState();

    print("initstae ghome");

    loginchek();
  }

  String pho = '';

  Future<void> loginchek() async {
    pho = await securestorage().readsecurestorage('userlogin');
    if (pho == 'No Data') {
      Get.toNamed('/home');
    }else{
      print("ok chek login");
    }

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{ return false; },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(119, 32, 107, 1),
        appBar: AppBar(
          elevation: 0,
          title: Text("Dashboard"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(119, 32, 107, 1),
        ),
        body: SingleChildScrollView(
          child: Container(
            //height: 800,
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
                  height: 490,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                          child: Container(
                            // color: Colors.black,
                            margin: EdgeInsets.only(left: 25, right: 25),
                          ),
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
                                      Get.toNamed('/messmenu');
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 25, right: 25),
                                      //color: Colors.redAccent,
                                      height: 260,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 260,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      255, 17, 17, 17),
                                                  blurRadius: 25.0,
                                                  spreadRadius: 1.0,
                                                  offset: Offset(7.0, 7.0),
                                                ),
                                              ],
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/foodtime.jpg'),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  BorderRadius.circular(22),
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
                                    Get.toNamed('/analysis');
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
                                                  color: Color.fromARGB(
                                                      255, 17, 17, 17),
                                                  blurRadius: 25.0,
                                                  spreadRadius: 1.0,
                                                  offset: Offset(7.0, 7.0),
                                                ),
                                              ],
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/cal.jpg'),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  BorderRadius.circular(22),
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
