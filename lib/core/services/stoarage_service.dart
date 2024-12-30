import 'dart:io';

abstract class StoarageService {
  Future<String> uploadImage(File file, String fileName);
}
