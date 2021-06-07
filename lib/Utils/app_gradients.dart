import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(colors: [
    Color(0xFF0e0410),
    Color.fromRGBO(146, 37, 164, 0.8),
  ], stops: [
    0.0,
    0.995
  ], transform: GradientRotation(-42));
}
