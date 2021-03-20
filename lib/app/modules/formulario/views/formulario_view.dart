import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/formulario_controller.dart';

class FormularioView extends GetView<FormularioController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Confirmar Pedido',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: Get.mediaQuery.size.width,
            height: Get.mediaQuery.size.height -
                (Get.mediaQuery.padding.top + kToolbarHeight),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title:
                          Text("Nombre", style: TextStyle(color: Colors.black)),
                      subtitle: TextFormField(
                        controller: controller.nombreTextController,
                        decoration: InputDecoration(
                          hintText: "Escriba su nombre",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Este campo no puede ser vacio";
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text("RUC", style: TextStyle(color: Colors.black)),
                      subtitle: TextFormField(
                        controller: controller.rucTextController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Escriba su RUC",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Este campo no puede ser vacio";
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 22.0),
                    child: Text(
                      "Total: ${controller.pedidosController.total} GS.",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (controller.formKey.currentState!.validate()) {
            controller.pagar();
          }
        },
        child: Text(
          "Pagar",
          style: TextStyle(fontSize: 20),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.red,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
