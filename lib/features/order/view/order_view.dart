import 'package:commerce_hub_dashboard/core/helper/buid_appbar.dart';
import 'package:commerce_hub_dashboard/features/order/view/widget/filter_section.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Order view'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            FilterSection(),
          ],
        ),
      ),
    );
  }
}
