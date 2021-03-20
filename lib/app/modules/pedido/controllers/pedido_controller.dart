import 'package:asadito/app/data/models/Pedido.dart';
import 'package:get/get.dart';

class PedidoController extends GetxController {
  var carrito = <PedidoModel>[].obs;
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

  void agregarAlCarrito(PedidoModel pedido) {
    carrito.add(pedido);
    total.value = total.value + pedido.total;
  }

  void eliminarDelCarrito(int index) {
    var pedido = carrito[index];
    total.value = total.value - pedido.total;
    carrito.removeAt(index);
  }
}
