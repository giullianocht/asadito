import 'package:asadito/app/data/models/Notificacion.dart';
import 'package:asadito/app/data/providers/provider_webhook.dart';

class WebHookRepository {
  var apiClient = WebHookiClient();

  Stream<NotificacionModel> notificacionStream(String docId) {
    return apiClient.notificacionStream(docId);
  }

  Future<void> deleteAllNotificacion() async {
    return apiClient.deleteAllNotificacion();
  }
}
