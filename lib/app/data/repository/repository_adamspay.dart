import 'package:asadito/app/data/models/Deuda.dart';
import 'package:asadito/app/data/providers/provider_adamspay.dart';
import 'package:get/get.dart';

class AdamsPayRepository {
  var apiClient = ApiClient();

  Future<Response> crearDeuda(Deuda deuda) {
    return apiClient.crearDeuda(deuda);
  }
}
