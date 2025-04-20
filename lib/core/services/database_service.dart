abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});
  Future<dynamic> getData({
    String docementid,
    Map<String, dynamic> query,
    required String path,
  });
  Stream<dynamic> fetchStreamData({
    Map<String, dynamic> query,
    required String path,
  });
  Future<void> updateData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});
  Future<bool> checkIfDataExists(
      {required String path, required String docuementId});
}
