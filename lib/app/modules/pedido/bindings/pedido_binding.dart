import 'package:get/get.dart';

import '../controllers/pedido_controller.dart';

class PedidoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PedidoController>(
      PedidoController(),
      permanent: true,
    );
  }
}
