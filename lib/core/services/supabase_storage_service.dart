import 'dart:io';

import 'package:commerce_hub_dashboard/constens.dart';
import 'package:commerce_hub_dashboard/core/services/stoarage_service.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StoarageService {
  static late Supabase _supabase;
  static intiSupabase() async {
    _supabase = await Supabase.initialize(
      url: profileUrl,
      anonKey: anonKey,
    );
  }

  @override
  Future<String> uploadImage(File file, String path) async {
    String filename = b.basename(file.path);
    String extentionName = b.extension(file.path);
    var result = await _supabase.client.storage
        .from('fruits_hub')
        .upload('$path/$filename.$extentionName', file);
    return result;
  }
}