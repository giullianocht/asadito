import 'package:get/get.dart';

import '../controllers/formulario_controller.dart';

class FormularioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormularioController>(
      () => FormularioController(),
    );
  }
}
