import 'package:flutter/material.dart';

Color mC = Colors.grey.shade100;
Color mCL = Colors.white;
Color mCD = Colors.black.withOpacity(0.075);
Color mCC = Colors.green.withOpacity(0.65);
Color fCL = Colors.grey.shade600;

BoxDecoration nMbox = BoxDecoration(
  shape: BoxShape.circle,
  color: mC,
  boxShadow: [
    BoxShadow(
      color: mCD,
      offset: Offset(2, 2),
      blurRadius: 2,
    ),
    BoxShadow(
      color: mCL,
      offset: Offset(-2, -2),
      blurRadius: 2,
    ),
  ]
);

BoxDecoration nMboxInvert = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: mCD,
  boxShadow: [
    // BoxShadow(
    //   color: mCL,
    //   offset: Offset(1, 1),
    //   blurRadius: 1,
    //   spreadRadius: -1
    // ),
  ]
);
