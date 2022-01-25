import 'package:flutter/material.dart';
import 'package:ukur_test/helper/placeholder.dart';
import 'package:ukur_test/helper/schema.dart';

class ProductDetailPlaceholder extends StatelessWidget {
  const ProductDetailPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: const [
              AspectRatio(aspectRatio: 1 / 1, child: CustomPlaceholder()),
            ],
          ),
          marginHeight(12),
          Padding(
            padding: horizontalPadding(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [CustomPlaceholder(width: 200, height: 20)],
                ),
                marginHeight(10),
                Row(
                  children: const [CustomPlaceholder(width: 200, height: 20)],
                ),
                const Divider(
                  thickness: 10,
                  color: kWhite,
                ),
                marginHeight(15),
                Row(
                  children: const [CustomPlaceholder(width: 200, height: 20)],
                ),
                marginHeight(10),
                Row(
                  children: const [CustomPlaceholder(width: 200, height: 20)],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
