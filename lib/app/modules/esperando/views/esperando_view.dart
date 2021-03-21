import 'package:asadito/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/esperando_controller.dart';

class EsperandoView extends GetView<EsperandoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: ElevatedButton(
          onPressed: () {
            Get.offAllNamed(Routes.HOME);
          },
          child: Text(
            controller.mensaje,
            style: TextStyle(fontSize: 20),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.red,
            ),
          ),
        )),
      ),
    );
  }
}
