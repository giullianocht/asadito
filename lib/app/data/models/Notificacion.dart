import 'package:cloud_firestore/cloud_firestore.dart';

class NotificacionModel {
  late String id;
  late String estadoPago;
  late String objEstado;
  NotificacionModel() {
    id = "";
    estadoPago = "";
    objEstado = "";
  }
  NotificacionModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    id = documentSnapshot.data()!["debt"]["docId"];
    estadoPago = documentSnapshot.data()!["debt"]["payStatus"]["status"];
    objEstado = documentSnapshot.data()!["debt"]["objStatus"]["status"];
  }
}
