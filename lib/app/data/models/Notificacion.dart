import 'package:cloud_firestore/cloud_firestore.dart';

class NotificacionModel {
  late String id;
  late String estadoPago;
  late String objEstado;
  NotificacionModel(
      {required this.id, required this.estadoPago, required this.objEstado});
  NotificacionModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    id = documentSnapshot.data()!["debt"]["docId"];
    estadoPago = documentSnapshot.data()!["debt"]["payStatus"]["status"];
    objEstado = documentSnapshot.data()!["debt"]["objStatus"]["status"];
  }
}
