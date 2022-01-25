import 'package:flutter/material.dart';
import 'package:ukur_test/helper/placeholder.dart';
import 'package:ukur_test/helper/schema.dart';

class ListProductPlaceHolder extends StatelessWidget {
  const ListProductPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: ListView(
          children: [
            marginHeight(5),
            const CustomPlaceholder(width: null, height: 105),
            marginHeight(20),
            const CustomPlaceholder(width: null, height: 105),
          ],
        ),
      ),
    );
  }
}
