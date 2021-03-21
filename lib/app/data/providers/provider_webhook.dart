import 'package:asadito/app/data/models/Notificacion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WebHookiClient {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  final CollectionReference _dbNotificaciones =
      _db.collection("notificaciones");

  Stream<NotificacionModel> notificacionStream(String docId) {
    return _dbNotificaciones.snapshots().map((query) {
      var lista = <NotificacionModel>[];
      query.docs.forEach((element) {
        lista.add(NotificacionModel.fromDocumentSnapshot(element));
      });
      var index = lista.indexWhere((element) => element.id == docId);
      if (index != -1) {
        return lista[index];
      } else {
        return NotificacionModel();
      }
    });
  }

  Future<void> _deleteNotificacion(String uid) async {
    try {
      await _dbNotificaciones.doc(uid).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteAllNotificacion() async {
    var listaID = [];
    await _dbNotificaciones.get().then(
          (value) => value.docs.forEach(
            (element) {
              listaID.add(element.id);
            },
          ),
        );
    listaID.forEach((element) {
      _deleteNotificacion(element);
    });
  }
}
