import 'package:commerce_hub_dashboard/core/services/get_it_service.dart';
import 'package:commerce_hub_dashboard/core/services/supabase_storage_service.dart';
import 'package:commerce_hub_dashboard/core/utils/app_route.dart';
import 'package:commerce_hub_dashboard/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SupabaseStorageService.intiSupabase();
  await Firebase.initializeApp();
  setupGetit();

  runApp(
    Dashboard(
      appRouter: AppRouter(),
    ),
  );
}
