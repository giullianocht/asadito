import 'package:asadito/app/data/models/Comida.dart';
import 'package:asadito/app/data/models/Pedido.dart';
import 'package:asadito/app/modules/pedido/controllers/pedido_controller.dart';
import 'package:get/get.dart';

class ComidaController extends GetxController {
  ComidaModel comida = Get.arguments;
  var pedidosController = Get.find<PedidoController>();

  var cantidad = 0.obs;
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void agregarCantidad() {
    cantidad.value++;
    total.value = cantidad.value * comida.precio;
  }

  void decrementarCantidad() {
    if (cantidad.value > 0) {
      cantidad.value--;
      total.value = cantidad.value * comida.precio;
    }
  }

  void agregarPedido() {
    var pedido = PedidoModel(
      comida: comida,
      cantidad: cantidad.value,
    );
    pedidosController.agregarAlCarrito(pedido);
    Get.back();
  }
}
