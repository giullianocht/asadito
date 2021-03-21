import 'package:asadito/app/data/models/Pedido.dart';
import 'package:asadito/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/carrito_controller.dart';

class CarritoView extends GetView<CarritoController> {
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
          'Pedidos',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Obx(
          () => controller.pedidosController.carrito.isEmpty
              ? Text(
                  "No hay pedidos",
                  style: TextStyle(fontSize: 20),
                )
              : ListView.builder(
                  itemCount: controller.pedidosController.carrito.length,
                  itemBuilder: (_, index) => _tarjeta(
                      controller.pedidosController.carrito[index], index),
                ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Get.toNamed(Routes.FORMULARIO);
        },
        child: Obx(
          () => Text(
            "Confirmar Pedido ${controller.pedidosController.total} GS.",
            style: TextStyle(fontSize: 20),
          ),
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

  Widget _tarjeta(PedidoModel pedido, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Get.mediaQuery.size.height * 0.20,
        child: Card(
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 7.0,
                      ),
                      Icon(
                        Icons.mood,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Text(
                        pedido.comida.nombre.capitalize!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                    ),
                    child: Text(
                      "Cantidad: ${(pedido.cantidad)}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      bottom: 10.0,
                    ),
                    child: Text(
                      "Total: ${(pedido.cantidad * pedido.comida.precio)} GS.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                      size: 35.0,
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                        title: "Eliminar pedido",
                        content: Text(
                          "¿Desea eliminar su pedido?",
                        ),
                        textConfirm: "Si, eliminar",
                        confirmTextColor: Colors.white,
                        buttonColor: Colors.red,
                        onConfirm: () async {
                          await Future.delayed(Duration(milliseconds: 500));
                          Get.back();
                          await Future.delayed(Duration(milliseconds: 750));
                          controller.pedidosController
                              .eliminarDelCarrito(index);
                          if (controller.pedidosController.carrito.isEmpty) {
                            Get.back();
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
