import 'package:asadito/app/modules/pedido/controllers/pedido_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormularioController extends GetxController {
  var pedidosController = Get.find<PedidoController>();

  var nombreTextController = TextEditingController();
  var rucTextController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
