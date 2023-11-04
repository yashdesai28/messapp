import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/guestanalysis_controller.dart';

class GuestanalysisView extends GetView<GuestanalysisController> {
  const GuestanalysisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GuestanalysisView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GuestanalysisView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
