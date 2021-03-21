import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EsperandoController extends GetxController {
  String mensaje = "Realizar otro pedido";
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    Get.defaultDialog(
      title: "¡Gracias!",
      content: Text("Su pedido se esta preparando, aguarde un momento."),
    );
    await Future.delayed(Duration(seconds: 7));
    if (Get.isDialogOpen!) {
      Get.back();
    }
    super.onReady();
  }

  @override
  void onClose() {}
}
