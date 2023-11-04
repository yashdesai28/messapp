import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hosteleranalysis_controller.dart';

class HosteleranalysisView extends StatefulWidget {
  const HosteleranalysisView({super.key});

  @override
  State<HosteleranalysisView> createState() => _HosteleranalysisViewState();
}

class _HosteleranalysisViewState extends State<HosteleranalysisView> {
  HosteleranalysisController controller = Get.put(HosteleranalysisController());

  void initState() {
    super.initState();

    print("initstae");

    lod();
  }

  int? total_current_booking;
  int? total_number_hosteler;
  int? total_number_of_remaining_submit_from;
  int? current_booking_for_breakfast;
  int? current_booking_for_lunch;
  int? current_booking_for_dinner;
  int? remaining_student_for_having_breakfast_attendance;
  int? remaining_student_for_having_lunch_attendance;
  int? remaining_student_for_having_dinner_attendance;
  int? total_number_student_for_having_breakfast_attendance;
  int? total_number_student_for_having_lunch_attendance;
  int? total_number_student_for_having_dinner_attendance;

  Future<void> lod() async {
    var analysis_data = await controller.fetchmenudata();

    setState(() {
      total_current_booking = analysis_data["total_current_booking"];
      total_number_hosteler = analysis_data["total_number_hosteler"];
      total_number_of_remaining_submit_from =
          analysis_data["total_number_of_remaining_submit_from"];
      current_booking_for_breakfast =
          analysis_data["current_booking_for_breakfast"];
      current_booking_for_lunch = analysis_data["current_booking_for_lunch"];
      current_booking_for_dinner = analysis_data["current_booking_for_dinner"];
      remaining_student_for_having_breakfast_attendance =
          analysis_data["remaining_student_for_having_breakfast_attendance"];
      remaining_student_for_having_lunch_attendance =
          analysis_data["remaining_student_for_having_lunch_attendance"];
      remaining_student_for_having_dinner_attendance =
          analysis_data["remaining_student_for_having_dinner_attendance"];
      total_number_student_for_having_breakfast_attendance =
          analysis_data["total_number_student_for_having_breakfast_attendance"];
      total_number_student_for_having_lunch_attendance =
          analysis_data["total_number_student_for_having_lunch_attendance"];
      total_number_student_for_having_dinner_attendance =
          analysis_data["total_number_student_for_having_dinner_attendance"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        elevation: 0,
        title: Text("Hosteler Analysis Report"),
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 7,
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 2 - 2,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(201, 177, 212, 0.8),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/subdone.png'),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "Total Number Of Bookings",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${total_current_booking}",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 2 - 2,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(201, 238, 133, 0.8),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/hostel.png'),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "Total Number Of Hostellers",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${total_number_hosteler}",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 2 - 2,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(95, 177, 255, 0.75),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/submit.png'),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Total Number Of Students\n Remained to Submit Names",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "${total_number_of_remaining_submit_from}",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 2 - 2,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(255, 177, 255, 0.75),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/curr.png'),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Current Bookings \n For Breakfast",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${current_booking_for_breakfast}",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 2 - 2,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(30, 166, 152, 0.75),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/curr.png'),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 2,),
                              Text(
                                "Current Bookings\n        For Lunch",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 7,),
                              Text(
                                "${current_booking_for_lunch}",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 2 - 2,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(255, 244, 83, 0.75),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/curr.png'),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 2,),
                              Text(
                                "Current Bookings\n   For Dinner",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 7,),
                              Text(
                                "${current_booking_for_dinner}",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 2 - 2,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(105, 176, 101, 0.7),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/rem.png'),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                "Students Remained \n     for Breakfast",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 7,),
                              Text(
                                "${remaining_student_for_having_breakfast_attendance}",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 2 - 2,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(242, 180, 173, 0.6),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/rem.png'),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                "Students Remained \n       for Lunch",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 7,),
                              Text(
                                "${remaining_student_for_having_lunch_attendance}",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 2 - 2,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 19, 50, 0.37),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/rem.png'),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                "Students Remained \n     for Dinner",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 7,),
                              Text(
                                "${remaining_student_for_having_dinner_attendance}",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 2 - 2,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 81, 50, 0.37),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/right.png'),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                "Total Students \n   for Breakfast",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 7,),
                              Text(
                                "${total_number_student_for_having_breakfast_attendance}",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 2 - 2,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 81, 179, 0.37),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/right.png'),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                "Total Students\n     for Lunch",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 7,),
                              Text(
                                "${total_number_student_for_having_lunch_attendance}",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 2 - 2,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 92, 166, 0.71),
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/right.png'),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 5,),
                              Text(
                                "Total Students\n     for Dinner",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 7,),
                              Text(
                                "${total_number_student_for_having_dinner_attendance}",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
