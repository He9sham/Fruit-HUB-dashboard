import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_hub_dashboard/core/services/database_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<dynamic> getData(
      {String? docementid,
      required String path,
      Map<String, dynamic>? query}) async {
    if (docementid != null) {
      var data = await firestore.collection(path).doc(docementid).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);

      if (query != null) {
        if (query['orderBy'] != null) {
          var orderbyfield = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderbyfield, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docuementId}) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.exists;
  }
}
