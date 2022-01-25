import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomPlaceholder extends StatelessWidget {
  final double? width;
  final double? height;

  const CustomPlaceholder({Key? key, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
        ),
      ),
    );
  }
}
