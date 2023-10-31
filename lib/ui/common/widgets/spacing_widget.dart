import 'package:flutter/material.dart';

class SpacingWidget extends StatelessWidget {
  final double? height;
  final double? width;

  const SpacingWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    if (width == null && height == null) {
      return const Text("");
    } else {
      return SizedBox(height: height, width: width);
    }
  }
}
