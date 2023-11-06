import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:plate_planner/app/data/secure_storage.dart';
import 'package:plate_planner/app/modules/hmenu/bindings/menumodel.dart';
import 'package:plate_planner/app/modules/hmenu/controllers/hmenu_controller.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
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
  var _razorpay;

  HmenuController controller = Get.put(HmenuController());

  GmenuController gmenuController = Get.put(GmenuController());

  double price = 50;
  double hon = 100;
  double? rezor;
  double quantity = 1;

  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();

    print("initstae");

    lod();
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds

    print("payment done");

    sentdatacontroller();
  }

  Future<void> sentdatacontroller() async {
    var pho = await securestorage().readsecurestorage('userlogin');

    print("quantity = $quantity");
    print("price = $price");

    var data = {
      "contact_number": pho.toString(),
      "quantity": quantity.toString(),
      "amount": price.toString(),
    };

    print(data);

    // // Introduce a delay of 3 seconds before calling gfetchmenudata
    // await Future.delayed(Duration(seconds: 3));

    await gmenuController.gfetchmenudata(data);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("error in payemnt");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  late List<Menudata> jsonData;
  String days = '';
  String Breakfast = '';
  String dinner = '';
  String lunch = '';

  Future<void> lod() async {
    
    var chek= await gmenuController.chekmeals();

    print("gmenu view said = ${chek}");
    print(chek[0]["mes"]);

    if(chek[0]["mes"]=="not data"){

      print("no data is match");
    }
    else{
        Get.toNamed('/gqrcode');
    }

    

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
                height: MediaQuery.of(context).size.height - 250,
                width: double.infinity,
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
                    height: MediaQuery.of(context).size.height - 460,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Quantity",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blue, // Set the background color
                borderRadius:
                    BorderRadius.circular(10), // Optional: Apply border radius
              ),
              child: SpinBox(
                  min: 1,
                  max: 100,
                  value: 1,
                  onChanged: (value) {
                    setState(() {
                      quantity = value;
                      price = 50 * value;
                    });
                  }),
            ),
            SizedBox(
              height: 10,
            ),
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
                  rezor = price * hon;
                  print("rzo");
                  var options = {
                    'key': 'rzp_test_PThWulOiktMSCZ',
                    'amount': rezor,
                    //'amount': 100,
                    'name': 'Plate Planner',
                    'description': 'booking meals',
                    'timeout': 300, // in seconds
                  };

                  try {
                    _razorpay.open(options);
                  } catch (e) {
                    debugPrint('Error:e');
                  }

                  //sentdatacontroller();
                  
                },
                child: Text(
                  "Pay ₹${price}",
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

  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
