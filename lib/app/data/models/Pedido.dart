import 'package:asadito/app/data/models/Comida.dart';

class PedidoModel {
  ComidaModel comida;
  int cantidad;
  PedidoModel({required this.comida, required this.cantidad});
  int get total {
    return _calculo();
  }

  int _calculo() {
    return cantidad * comida.precio;
  }
}
