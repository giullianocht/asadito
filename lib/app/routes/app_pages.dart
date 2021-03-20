import 'package:get/get.dart';

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
  ];
}
