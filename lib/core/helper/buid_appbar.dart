import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar({required String title}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    automaticallyImplyLeading: false,
  );
}