import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/gqrcode_controller.dart';

// class GqrcodeView extends GetView<GqrcodeController> {
//   const GqrcodeView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('GqrcodeView'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'GqrcodeView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class GqrcodeView extends StatefulWidget {
  const GqrcodeView({super.key});

  @override
  State<GqrcodeView> createState() => _GqrcodeViewState();
}

class _GqrcodeViewState extends State<GqrcodeView> {
  GqrcodeController controller = Get.put(GqrcodeController());

  void initState() {
    super.initState();

    print("initstae");

    lod();
  }

  var data;
  var chek1;

  Future<void> lod() async {
    print("this is lod in qr scanner ");

    var chek= await controller.chekmeals();


    print("gmenu view said = ${chek}");
    print(chek[0]["mes"]);

    var data1 = await controller.gshowmeals();

    setState(() {
      data = data1;
      chek1 = chek;
    });
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();

    // Format the date as a string
    String formattedDate =
        "${currentDate.day}-${currentDate.month}-${currentDate.year}";
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("QR Code"),
          // titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
          backgroundColor: Color.fromRGBO(119, 32, 107, 1),
          leading: IconButton(
              onPressed: () {
                Get.toNamed('/guesthome');
              },
              icon: Icon(Icons.arrow_back_ios,
                  size: 20, color: const Color.fromARGB(255, 255, 255, 255))),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "QR Scanner",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcom",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Use this QR code to fill your attendance and \n              to get your food of ${formattedDate}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),if (chek1[0]["mes"]!="not data") // Replace yourCondition with the actual condition
            QrImageView(
              data: data,
              version: QrVersions.auto,
              size: 200.0,
            )
          else
            Text(
              "Condition not met content",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
