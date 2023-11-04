import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/analysis_controller.dart';

class AnalysisView extends StatefulWidget {
  const AnalysisView({super.key});

  @override
  State<AnalysisView> createState() => _AnalysisViewState();
}

class _AnalysisViewState extends State<AnalysisView> {
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
          children: <Widget>[
            Expanded(
                child: Stack(children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 130,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 330,
                    width: double.infinity,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/hosteleranalysis');
                          },
                          child: Container(
                              padding:
                                  EdgeInsets.only(left: 30, right: 30, top: 20),
                              //color: Color.fromARGB(255, 215, 117, 117),
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Color.fromARGB(255, 30, 239, 131),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(40),
                                            bottomRight: Radius.circular(40),
                                            topLeft: Radius.circular(40),
                                            topRight: Radius.circular(40))),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 70,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/ana.png'),
                                                  fit: BoxFit.fitHeight),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [Text("Hosteler Analysis Report",style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),fontSize: 20,fontWeight: FontWeight.bold),)],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                              ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/guestanalysis');
                          },
                          child: Container(
                              padding:
                                  EdgeInsets.only(left: 30, right: 30, top: 20),
                              //color: Color.fromARGB(255, 215, 117, 117),
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Color.fromARGB(255, 245, 203, 89),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(40),
                                            bottomRight: Radius.circular(40),
                                            topLeft: Radius.circular(40),
                                            topRight: Radius.circular(40))),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 70,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/ana.png'),
                                                  fit: BoxFit.fitHeight),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [Text("guest Analysis Report",style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),fontSize: 20,fontWeight: FontWeight.bold),)],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                              ),
                        ),
                      ],
                    ),

                    //color: Colors.amber,
                  ),
                ],
              )
            ]))
          ],
        ),
      ),
    );
  }
}
