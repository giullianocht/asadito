import 'package:asadito/app/data/models/Notificacion.dart';
import 'package:asadito/app/data/providers/provider_webhook.dart';

class WebHookRepository {
  var apiClient = WebHookiClient();

  Stream<List<NotificacionModel>> notificacionesStream() {
    return apiClient.notificacionesStream();
  }
}
