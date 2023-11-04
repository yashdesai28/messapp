import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/qrscanner_controller.dart';

class QrscannerView extends StatefulWidget {
  const QrscannerView({Key? key}) : super(key: key);

  @override
  State<QrscannerView> createState() => _QrscannerViewState();
}

class _QrscannerViewState extends State<QrscannerView> {
  QrscannerController qrscannerController = Get.put(QrscannerController());
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text("Scanner"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(119, 32, 107, 1),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Place the QR Code in the area",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Scanning will be started automatically",
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    buildQRView(context),
                    Positioned(
                      bottom: 10,
                      left: 16, // Adjust left position as needed
                      right: 16, // Adjust right position as needed
                      child: buildResult(),
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

  Widget buildResult() => Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Text(barcode != null ? '${barcode!.code}' : 'Scan a code'));

  Widget buildQRView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.amberAccent,
          borderLength: 20,
          borderRadius: 10,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );
  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((barcode) async {
      setState(() {
        this.barcode = barcode;
      });

      // Perform your action after scanning the QR code
      if (qrscannerController != null) {
        String? barcodeData = barcode.code;
        String chek = await qrscannerController.qrscan(barcodeData);

        Get.snackbar(
          'Something Went Wrong ',
          '${chek}',
          backgroundColor: Color.fromARGB(255, 19, 19, 19),
          borderRadius: 25.0,
          margin: EdgeInsets.all(16.0),
          colorText: const Color.fromARGB(255, 255, 255, 255),
          snackPosition: SnackPosition.TOP, // Adjust the position as needed
          duration: Duration(seconds: 5), // Adjust the duration as needed
          overlayBlur: 4.0,
          overlayColor: Colors.black.withOpacity(0.1),
          forwardAnimationCurve: Curves.easeInOut,
          reverseAnimationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          mainButton: TextButton(
            onPressed: () {
              controller.resumeCamera();
              Get.back(); // Close the snackbar
            },
            child: Text(
              'Dismiss',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );

        // Pause the camera after generating data
        controller.pauseCamera();
      }
    });
  }
}
