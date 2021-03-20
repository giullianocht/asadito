import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/adamspay_controller.dart';

class AdamspayView extends GetView<AdamspayController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AdamspayView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AdamspayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
