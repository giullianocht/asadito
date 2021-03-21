import 'package:get/get.dart';

import '../controllers/esperando_controller.dart';

class EsperandoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EsperandoController>(
      () => EsperandoController(),
    );
  }
}
