import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:plate_planner/app/modules/hmenu/bindings/menumodel.dart';

import '../controllers/menucard_controller.dart';

// class MenucardView extends GetView<MenucardController> {
//   const MenucardView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MenucardView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'MenucardView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }



class mondaymenu extends StatefulWidget {
  const mondaymenu({super.key});

  @override
  State<mondaymenu> createState() => _mondaymenuState();
}

class _mondaymenuState extends State<mondaymenu> {
 
  MenucardController controller = Get.put(MenucardController());

  void initState() {
    super.initState();

    print("initstae");

    lod();
  }

late List<Menudata> jsonData;
String days='';
String Breakfast='';
String dinner='';
String lunch='';

  Future<void> lod() async {
    jsonData=await controller.fetchmenudata("Monday");
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
        lunch=menu.lunch;
        dinner=menu.dinner;
        days=menu.days;

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
      backgroundColor: Color.fromRGBO(32, 107, 119, 1),
      appBar: AppBar(
        elevation: 0,
        title: Text("Menu"),
        // titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
        backgroundColor: Color.fromRGBO(119, 32, 107, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
                size: 20, color: const Color.fromARGB(255, 255, 255, 255))),
      ),
      body: Container(
        child: Column(
          children:<Widget> [
            Expanded(child: Stack(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 130,
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
                      image: AssetImage('assets/menu1.jpg'), fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),
            Column(
              
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 510,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 330,
                  width: double.infinity,
                  child: Column(
                    children: [

                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 215, 117, 117),
                        child: Column(
                          
                        children: [
                                    Text('$days',style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    // Text('$formattedDate',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold)),

                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    
                        ],
                      ) 
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 215, 117, 117),
                        child: Column(
                          
                        children: [
                                    Text("Breakfast",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$Breakfast',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
                      ),

                      SizedBox(height: 15,),
                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: const Color.fromARGB(255, 216, 166, 166),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                    Text("Lunch",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$lunch',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
                      ),

                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 166, 166, 216),
                        child: Column(
                        children: [
                                    Text("Dinner",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$dinner',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
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

class Tuesday extends StatefulWidget {
  const Tuesday({super.key});

  @override
  State<Tuesday> createState() => _TuesdayState();
}

class _TuesdayState extends State<Tuesday> {
 MenucardController controller = Get.put(MenucardController());

  void initState() {
    super.initState();

    print("initstae");

    lod();
  }

late List<Menudata> jsonData;
String days='';
String Breakfast='';
String dinner='';
String lunch='';

  Future<void> lod() async {
    jsonData=await controller.fetchmenudata("Tuesday");
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
        lunch=menu.lunch;
        dinner=menu.dinner;
        days=menu.days;

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
      backgroundColor: Color.fromRGBO(32, 119, 44, 1),
      appBar: AppBar(
        elevation: 0,
        title: Text("Menu"),
        // titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
        backgroundColor: Color.fromRGBO(119, 32, 107, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
                size: 20, color: const Color.fromARGB(255, 255, 255, 255))),
      ),
      body: Container(
        child: Column(
          children:<Widget> [
            Expanded(child: Stack(children: <Widget>[
              
          
            Container(
              height: MediaQuery.of(context).size.height - 130,
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
                      image: AssetImage('assets/menu1.jpg'), fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),
            Column(
              
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 510,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 330,
                  width: double.infinity,
                  child: Column(
                    children: [

                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 215, 117, 117),
                        child: Column(
                          
                        children: [
                                    Text('$days',style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    // Text('$formattedDate',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold)),

                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    
                        ],
                      ) 
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 215, 117, 117),
                        child: Column(
                          
                        children: [
                                    Text("Breakfast",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$Breakfast',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
                      ),

                      SizedBox(height: 15,),
                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: const Color.fromARGB(255, 216, 166, 166),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                    Text("Lunch",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$lunch',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
                      ),

                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 166, 166, 216),
                        child: Column(
                        children: [
                                    Text("Dinner",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$dinner',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
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

class wednesday extends StatefulWidget {
  const wednesday({super.key});

  @override
  State<wednesday> createState() => _wednesdayState();
}

class _wednesdayState extends State<wednesday> {
   MenucardController controller = Get.put(MenucardController());

  void initState() {
    super.initState();

    print("initstae");

    lod();
  }

late List<Menudata> jsonData;
String days='';
String Breakfast='';
String dinner='';
String lunch='';

  Future<void> lod() async {
    jsonData=await controller.fetchmenudata("Wednesday");
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
        lunch=menu.lunch;
        dinner=menu.dinner;
        days=menu.days;

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
      backgroundColor: Color.fromRGBO(204, 83, 12, 1),
      appBar: AppBar(
        elevation: 0,
        title: Text("Menu"),
        // titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
        backgroundColor: Color.fromRGBO(119, 32, 107, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
                size: 20, color: const Color.fromARGB(255, 255, 255, 255))),
      ),
      body: Container(
        child: Column(
          children:<Widget> [
            Expanded(child: Stack(children: <Widget>[
              
          
            Container(
              height: MediaQuery.of(context).size.height - 130,
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
                      image: AssetImage('assets/menu1.jpg'), fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),
            Column(
              
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 510,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 330,
                  width: double.infinity,
                  child: Column(
                    children: [

                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 215, 117, 117),
                        child: Column(
                          
                        children: [
                                    Text('$days',style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    // Text('$formattedDate',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold)),

                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    
                        ],
                      ) 
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 215, 117, 117),
                        child: Column(
                          
                        children: [
                                    Text("Breakfast",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$Breakfast',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
                      ),

                      SizedBox(height: 15,),
                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: const Color.fromARGB(255, 216, 166, 166),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                    Text("Lunch",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$lunch',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
                      ),

                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 166, 166, 216),
                        child: Column(
                        children: [
                                    Text("Dinner",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$dinner',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
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


class Thursday extends StatefulWidget {
  const Thursday({super.key});

  @override
  State<Thursday> createState() => _ThursdayState();
}

class _ThursdayState extends State<Thursday> {
 MenucardController controller = Get.put(MenucardController());

  void initState() {
    super.initState();

    print("initstae");

    lod();
  }

late List<Menudata> jsonData;
String days='';
String Breakfast='';
String dinner='';
String lunch='';

  Future<void> lod() async {
    jsonData=await controller.fetchmenudata("Thursday");
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
        lunch=menu.lunch;
        dinner=menu.dinner;
        days=menu.days;

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
      backgroundColor: Color.fromRGBO(204, 12, 111, 1),
      appBar: AppBar(
        elevation: 0,
        title: Text("Menu"),
        // titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
        backgroundColor: Color.fromRGBO(119, 32, 107, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
                size: 20, color: const Color.fromARGB(255, 255, 255, 255))),
      ),
      body: Container(
        child: Column(
          children:<Widget> [
            Expanded(child: Stack(children: <Widget>[
              
          
            Container(
              height: MediaQuery.of(context).size.height - 130,
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
                      image: AssetImage('assets/menu1.jpg'), fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),
            Column(
              
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 510,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 330,
                  width: double.infinity,
                  child: Column(
                    children: [

                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 215, 117, 117),
                        child: Column(
                          
                        children: [
                                    Text('$days',style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    // Text('$formattedDate',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold)),

                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    
                        ],
                      ) 
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 215, 117, 117),
                        child: Column(
                          
                        children: [
                                    Text("Breakfast",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$Breakfast',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
                      ),

                      SizedBox(height: 15,),
                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: const Color.fromARGB(255, 216, 166, 166),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                    Text("Lunch",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$lunch',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
                      ),

                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 166, 166, 216),
                        child: Column(
                        children: [
                                    Text("Dinner",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$dinner',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
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

class friday extends StatefulWidget {
  const friday({super.key});

  @override
  State<friday> createState() => _fridayState();
}

class _fridayState extends State<friday> {
  MenucardController controller = Get.put(MenucardController());

  void initState() {
    super.initState();

    print("initstae");

    lod();
  }

late List<Menudata> jsonData;
String days='';
String Breakfast='';
String dinner='';
String lunch='';

  Future<void> lod() async {
    jsonData=await controller.fetchmenudata("Friday");
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
        lunch=menu.lunch;
        dinner=menu.dinner;
        days=menu.days;

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
      backgroundColor: Color.fromRGBO(204, 12, 172, 1),
      appBar: AppBar(
        elevation: 0,
        title: Text("Menu"),
        // titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
        backgroundColor: Color.fromRGBO(119, 32, 107, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
                size: 20, color: const Color.fromARGB(255, 255, 255, 255))),
      ),
      body: Container(
        child: Column(
          children:<Widget> [
            Expanded(child: Stack(children: <Widget>[
              
          
            Container(
              height: MediaQuery.of(context).size.height - 130,
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
                      image: AssetImage('assets/menu1.jpg'), fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),
            Column(
              
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 510,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 330,
                  width: double.infinity,
                  child: Column(
                    children: [

                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 215, 117, 117),
                        child: Column(
                          
                        children: [
                                    Text('$days',style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    // Text('$formattedDate',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold)),

                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    
                        ],
                      ) 
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 215, 117, 117),
                        child: Column(
                          
                        children: [
                                    Text("Breakfast",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$Breakfast',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
                      ),

                      SizedBox(height: 15,),
                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: const Color.fromARGB(255, 216, 166, 166),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                    Text("Lunch",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$lunch',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
                      ),

                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 166, 166, 216),
                        child: Column(
                        children: [
                                    Text("Dinner",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$dinner',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
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

class saturday extends StatefulWidget {
  const saturday({super.key});

  @override
  State<saturday> createState() => _saturdayState();
}

class _saturdayState extends State<saturday> {
  MenucardController controller = Get.put(MenucardController());

  void initState() {
    super.initState();

    print("initstae");

    lod();
  }

late List<Menudata> jsonData;
String days='';
String Breakfast='';
String dinner='';
String lunch='';

  Future<void> lod() async {
    jsonData=await controller.fetchmenudata("Saturday");
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
        lunch=menu.lunch;
        dinner=menu.dinner;
        days=menu.days;

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
      backgroundColor: Color.fromRGBO(12, 44, 204, 1),
      appBar: AppBar(
        elevation: 0,
        title: Text("Menu"),
        // titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
        backgroundColor: Color.fromRGBO(119, 32, 107, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
                size: 20, color: const Color.fromARGB(255, 255, 255, 255))),
      ),
      body: Container(
        child: Column(
          children:<Widget> [
            Expanded(child: Stack(children: <Widget>[
              
          
            Container(
              height: MediaQuery.of(context).size.height - 130,
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
                      image: AssetImage('assets/menu1.jpg'), fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),
            Column(
              
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 510,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 330,
                  width: double.infinity,
                  child: Column(
                    children: [

                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 215, 117, 117),
                        child: Column(
                          
                        children: [
                                    Text('$days',style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    // Text('$formattedDate',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold)),

                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    
                        ],
                      ) 
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 215, 117, 117),
                        child: Column(
                          
                        children: [
                                    Text("Breakfast",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$Breakfast',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
                      ),

                      SizedBox(height: 15,),
                      Container(
                          padding: EdgeInsets.only(left: 30,right: 30),
                        //color: const Color.fromARGB(255, 216, 166, 166),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                    Text("Lunch",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$lunch',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
                      ),

                      SizedBox(height: 15,),
                      Container(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        //color: Color.fromARGB(255, 166, 166, 216),
                        child: Column(
                        children: [
                                    Text("Dinner",style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 146, 39, 10),fontWeight: FontWeight.bold),),
                                    Text("_____________________"),
                                    SizedBox(height: 10,),
                                    Text('$dinner',style: TextStyle(fontSize: 15),),
                        ],
                      ) 
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







