import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  final double w;

  const HorizontalSpace({super.key, required this.w});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: w);
  }
}

class VerticalSpace extends StatelessWidget {
  final double h;

  const VerticalSpace({super.key, required this.h});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(height: h);
  }
}
