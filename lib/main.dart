import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ukur_test/screens/product_sceeen.dart';
import 'package:ukur_test/helper/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'UKUR Test',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().themeData(context),
      home: const ProductListScreen(),
    );
  }
}
