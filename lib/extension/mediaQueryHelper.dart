import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get heightE => MediaQuery.sizeOf(this).height;
  double get widgetE => MediaQuery.sizeOf(this).width;
  double get textScaleFactorE => MediaQuery.textScaleFactorOf(this);
  double get topE => MediaQuery.of(this).viewInsets.top;
  double get rightE => MediaQuery.of(this).viewInsets.right;
  double get leftE => MediaQuery.of(this).viewInsets.left;
  double get bottomE => MediaQuery.of(this).viewInsets.bottom;
}
