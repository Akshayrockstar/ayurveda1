import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Palette {
  static final Color? GreyPrimary = Color(0xff000000).withOpacity(.2);
  static const Color DARK = Color(0x000000);
  static const Color Green = Color(0xff006837);
  static LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    //colors: [SECONDARY, PRIMARY],
    colors: [Colors.black, Colors.black],
  );
}
