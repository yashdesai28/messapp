import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ghistory_controller.dart';

class GhistoryView extends GetView<GhistoryController> {
  const GhistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GhistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GhistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
