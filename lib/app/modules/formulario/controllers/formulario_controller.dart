import 'package:asadito/app/data/models/Deuda.dart';
import 'package:asadito/app/data/models/EstadoDeuda.dart';
import 'package:asadito/app/data/providers/provider_adamspay.dart';
import 'package:asadito/app/modules/pedido/controllers/pedido_controller.dart';
import 'package:asadito/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormularioController extends GetxController {
  var api = ApiClient();

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

  Deuda _crearDeuda() {
    var cantidad = 0;
    pedidosController.carrito.forEach((element) {
      cantidad = cantidad + element.cantidad;
    });

    var json = {
      "debt": {
        "docId": "asadito-mesa7-${rucTextController.value.text}",
        "label": "Compra de asaditos",
        "amount": {
          "currency": "PYG",
          "value": "${pedidosController.total.value}"
        },
        "target": {
          "type": "cip",
          "number": "${rucTextController.value.text}",
          "label": "${nombreTextController.value.text}"
        },
        "validPeriod": {
          "start": DateTime.now(),
          "end": DateTime.now().add(Duration(hours: 12))
        },
        "description": {"summary": "Compra de $cantidad asaditos"}
      }
    };

    return Deuda.fromJson(json);
  }

  void pagar() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    try {
      var deuda = _crearDeuda();
      print(deuda.toJson());
      var respuesta = await api.crearDeuda(deuda);
      if (respuesta.body["meta"]["status"] == "success") {
        var estadoRespueta = EstadoDeuda.fromJson(respuesta.body);
        var linkDePago = estadoRespueta.debt.payUrl;
        //Go to PayUrl
        Get.offAllNamed(Routes.ADAMSPAY, arguments: linkDePago);
      } else {
        Get.back();
        Get.defaultDialog(
          title: "ERROR",
          content: Text("Ha sucedido un error, por favor intentalo en un rato"),
        );
      }
    } catch (e) {
      Get.back();
      Get.defaultDialog(
        title: "ERROR",
        content: Text("Ha sucedido un error, por favor intentalo en un rato"),
      );
    }
  }
}
