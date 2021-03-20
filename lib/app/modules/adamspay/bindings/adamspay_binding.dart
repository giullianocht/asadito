import 'package:get/get.dart';

import '../controllers/adamspay_controller.dart';

class AdamspayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdamspayController>(
      () => AdamspayController(),
    );
  }
}
