import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/comida_controller.dart';

class ComidaView extends GetView<ComidaController> {
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
            }),
        title: Text(
          controller.comida.nombre.capitalize!,
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Container(
              height: 250,
              width: 400,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17.0),
                child: Image.asset(
                  controller.comida.asset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 10.0, bottom: 50.0),
            child: Text(
              "Precio: ${controller.comida.precio} GS.",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Center(
            child: Text(
              "Cantidad",
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.remove_circle,
                  color: Colors.grey,
                  size: 35.0,
                ),
                onPressed: () {
                  controller.decrementarCantidad();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Obx(
                  () => Text(
                    controller.cantidad.value.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.grey,
                  size: 35.0,
                ),
                onPressed: () {
                  controller.agregarCantidad();
                },
              )
            ],
          )
        ],
      ),
      floatingActionButton: Obx(
        () => controller.cantidad.value != 0
            ? ElevatedButton(
                onPressed: () {
                  controller.agregarPedido();
                },
                child: Text(
                  "Agregar Pedido ${controller.total} GS.",
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.red,
                  ),
                ),
              )
            : Container(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
