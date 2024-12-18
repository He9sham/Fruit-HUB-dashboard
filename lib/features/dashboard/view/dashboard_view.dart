import 'package:commerce_hub_dashboard/core/theming/styles.dart';
import 'package:commerce_hub_dashboard/core/widgets/app_text_buttom.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DashboardView'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Center(
              child: AppTextButton(
                buttonText: 'Add Data',
                onPressed: () {},
                textStyle: Styles.textbuttom16White,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
