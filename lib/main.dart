import 'package:commerce_hub_dashboard/core/utils/app_route.dart';
import 'package:commerce_hub_dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(
    Dashboard(
      appRouter: AppRouter(),
    ),
  );
}
