import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/qrcode_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrcodeView extends StatefulWidget {
  const QrcodeView({super.key});

  @override
  State<QrcodeView> createState() => _QrcodeViewState();
}

class _QrcodeViewState extends State<QrcodeView> {
  QrcodeController controller = Get.put(QrcodeController());

  void initState() {
    super.initState();

    print("initstae");

    lod();
  }

  var data;

  Future<void> lod() async {
    print("this is lod in qr scanner ");

    var data1 = await controller.showmeals();

    setState(() {
      data = data1;
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
                Get.toNamed('/hostel-home');
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
              ),
              QrImageView(
                data: data,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
