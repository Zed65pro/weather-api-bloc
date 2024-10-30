import 'dart:ui';

import 'package:flutter/material.dart';

List<Widget> buildBackgroundGradientBlur() {
  return [
    Align(
      alignment: const AlignmentDirectional(3, -0.3),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurple),
      ),
    ),
    Align(
      alignment: const AlignmentDirectional(-3, -0.3),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF673AB7)),
      ),
    ),
    Align(
      alignment: const AlignmentDirectional(0, -1.2),
      child: Container(
        height: 300,
        width: 600,
        decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
      ),
    ),
    BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
      ),
    ),
  ];
}
