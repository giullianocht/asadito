import 'package:get/get.dart';

import 'package:asadito/app/modules/carrito/bindings/carrito_binding.dart';
import 'package:asadito/app/modules/carrito/views/carrito_view.dart';
import 'package:asadito/app/modules/comida/bindings/comida_binding.dart';
import 'package:asadito/app/modules/comida/views/comida_view.dart';
import 'package:asadito/app/modules/formulario/bindings/formulario_binding.dart';
import 'package:asadito/app/modules/formulario/views/formulario_view.dart';
import 'package:asadito/app/modules/home/bindings/home_binding.dart';
import 'package:asadito/app/modules/home/views/home_view.dart';
import 'package:asadito/app/modules/pedido/bindings/pedido_binding.dart';
import 'package:asadito/app/modules/pedido/views/pedido_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PEDIDO,
      page: () => PedidoView(),
      binding: PedidoBinding(),
    ),
    GetPage(
      name: _Paths.COMIDA,
      page: () => ComidaView(),
      binding: ComidaBinding(),
    ),
    GetPage(
      name: _Paths.CARRITO,
      page: () => CarritoView(),
      binding: CarritoBinding(),
    ),
    GetPage(
      name: _Paths.FORMULARIO,
      page: () => FormularioView(),
      binding: FormularioBinding(),
    ),
  ];
}
