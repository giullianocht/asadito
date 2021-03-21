import 'package:asadito/app/data/models/Notificacion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WebHookiClient {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  final CollectionReference _dbNotificaciones =
      _db.collection("notificaciones");

  Stream<List<NotificacionModel>> notificacionesStream() {
    return _dbNotificaciones.snapshots().map((query) {
      var lista = <NotificacionModel>[];
      query.docs.forEach((element) {
        lista.add(NotificacionModel.fromDocumentSnapshot(element));
      });
      return lista;
    });
  }
}
