import 'package:asadito/app/data/models/Comida.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pedido_controller.dart';

class PedidoView extends GetView<PedidoController> {
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
          'Realizar Pedido',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: ListView(
          children: [
            _tarjeta(
              ComidaModel(
                nombre: "Asadito de carne",
                precio: 5000,
                asset: "assets/carne.jpeg",
              ),
            ),
            _tarjeta(
              ComidaModel(
                nombre: "Asadito de pollo",
                precio: 2500,
                asset: "assets/pollo.jpeg",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tarjeta(ComidaModel comida) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Get.mediaQuery.size.height * 0.25,
        child: Card(
          elevation: 5,
          child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 7.0,
                          ),
                          Icon(
                            Icons.no_meals,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 7.0,
                          ),
                          Text(
                            comida.nombre,
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
                          bottom: 10.0,
                        ),
                        child: Text(
                          comida.precio.toString() + " GS.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 150,
                    width: 180,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17.0),
                      child: Image.asset(
                        comida.asset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
