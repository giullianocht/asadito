import 'package:asadito/app/data/models/Deuda.dart';
import 'package:asadito/app/data/models/EstadoDeuda.dart';
import 'package:asadito/app/data/providers/provider_adamspay.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  var api = ApiClient();
  test("Crear Deuda", () async {
    var json = {
      "debt": {
        "docId": "asadito-4484576",
        "label": "Compra de asadito",
        "amount": {"currency": "PYG", "value": "100000"},
        "target": {
          "type": "cip",
          "number": "4484570",
          "label": "Mateo Albrecht"
        },
        "validPeriod": {
          "start": DateTime.now(),
          "end": DateTime.now().add(Duration(hours: 12))
        },
        "description": {"summary": "Compra de 8 asaditos"}
      }
    };

    var deuda = Deuda.fromJson(json);

    try {
      var respuesta = await api.crearDeuda(deuda);
      if (respuesta.body["meta"]["status"] == "success") {
        var estadoRespueta = EstadoDeuda.fromJson(respuesta.body);
        print(estadoRespueta.debt.payUrl);
      }
    } catch (e) {
      print(e);
    }
    expect("", "");
  });
}
