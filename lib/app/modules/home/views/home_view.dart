import 'dart:ui';

import 'package:asadito/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(
            height: Get.mediaQuery.size.height * 0.10,
          ),
          Container(
            height: 150,
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                "assets/logo.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: Get.mediaQuery.size.height * 0.15,
          ),
          Text(
            "Mesa 7",
            style: TextStyle(fontSize: 35, shadows: [
              Shadow(
                blurRadius: 1.0,
                color: Colors.yellow,
              ),
            ]),
          ),
          SizedBox(
            height: Get.mediaQuery.size.height * 0.30,
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.PEDIDO);
            },
            child: Text(
              "Realizar Pedido",
              style: TextStyle(fontSize: 20),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.red,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
