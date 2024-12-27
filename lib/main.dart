import 'package:commerce_hub_dashboard/constens.dart';
import 'package:commerce_hub_dashboard/core/utils/app_route.dart';
import 'package:commerce_hub_dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
   await Supabase.initialize(
    url: profileUrl,
    anonKey: anonKey,
  );
  runApp(
    Dashboard(
      appRouter: AppRouter(),
    ),
  );
}
