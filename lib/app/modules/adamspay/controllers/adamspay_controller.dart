import 'package:asadito/app/data/models/EstadoDeuda.dart';
import 'package:asadito/app/data/models/Notificacion.dart';
import 'package:asadito/app/data/repository/repository_webhook.dart';
import 'package:asadito/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AdamspayController extends GetxController {
  EstadoDeuda respuesta = Get.arguments;
  var webHookRepository = WebHookRepository();
  RxList<NotificacionModel> notificaciones = RxList<NotificacionModel>();

  @override
  void onInit() {
    notificaciones.bindStream(webHookRepository.notificacionesStream());
    super.onInit();
  }

  @override
  void onReady() {
    ever<List<NotificacionModel>>(notificaciones, (lista) {
      print("***************");
      print("ESCUCHANDO");
      print("***************");
      lista.forEach((element) {
        if (element.id == respuesta.debt.docId) {
          if (element.objEstado == "success") {
            if (element.estadoPago == "paid") {
              Get.reset();
              Get.offAllNamed(Routes.ESPERANDO);
            } else if (element.estadoPago == "pending") {
              //Pago Pendiente
            } else {
              print("ERROR");
            }
          } else if (element.objEstado == "active") {
            //Pago Activo
          } else if (element.objEstado == "inactive") {
            //Pago Inactivo
          } else if (element.objEstado == "error") {
            //Pago Error
          } else if (element.objEstado == "expired") {
            //Pago Expirado
          } else if (element.objEstado == "canceled") {
            //Pago Cancelado
          } else {
            print("ERROR");
          }
        }
      });
    });
    super.onReady();
  }

  @override
  void onClose() {}
}
