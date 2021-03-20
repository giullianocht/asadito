import 'package:asadito/app/data/models/Deuda.dart';
import 'package:asadito/app/secret/key.dart';
import 'package:get/get.dart';

const baseUrl = 'https://staging.adamspay.com/api/v1/';

class ApiClient extends GetConnect {
  Future<Response> crearDeuda(Deuda deuda) {
    return post(baseUrl + "debts", deuda.toJson(), headers: {"apikey": apikey});
  }
}
