import 'package:commerce_hub_dashboard/core/utils/route.dart';
import 'package:commerce_hub_dashboard/features/add_product/view/add_product.dart';
import 'package:commerce_hub_dashboard/features/dashboard/view/dashboard_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.dashBoard:
        return MaterialPageRoute(
          builder: (_) => const DashboardView(),
        );
      case Routes.addProduct:
        return MaterialPageRoute(
          builder: (_) => const AddProduct(),
        );
      default:
        return null;
    }
  }
}
