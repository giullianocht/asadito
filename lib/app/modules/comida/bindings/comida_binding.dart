import 'package:get/get.dart';

import '../controllers/comida_controller.dart';

class ComidaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComidaController>(
      () => ComidaController(),
    );
  }
}
