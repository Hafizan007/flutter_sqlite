import 'package:flutter/material.dart';
import 'package:ukur_test/helper/schema.dart';

class ListProductEmpty extends StatelessWidget {
  const ListProductEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          marginHeight(50),
          const Center(
            child: SizedBox(
              width: double.infinity,
              child: Icon(
                Icons.zoom_out,
                color: kPrimaryColor,
                size: 120,
              ),
            ),
          ),
          marginHeight(20),
          Center(
            child: Text(
              'Products is empty',
              style: mediumStyle(18),
            ),
          )
        ],
      ),
    );
  }
}
