import 'package:get/get.dart';

import '../controllers/carrito_controller.dart';

class CarritoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarritoController>(
      () => CarritoController(),
    );
  }
}
