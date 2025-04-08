import 'package:commerce_hub_dashboard/core/theming/styles.dart';
import 'package:commerce_hub_dashboard/core/utils/route.dart';
import 'package:commerce_hub_dashboard/core/widgets/app_text_buttom.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextButton(
              buttonText: 'Add Data',
              onPressed: () {
                Navigator.pushNamed(context, Routes.addProduct);
              },
              textStyle: Styles.textbuttom16White,
            ),
            SizedBox(
              height: 20,
            ),
            AppTextButton(
              buttonText: 'View Order',
              onPressed: () {
                Navigator.pushNamed(context, Routes.order);
              },
              textStyle: Styles.textbuttom16White,
            ),
          ],
        ),
      ),
    );
  }
}
