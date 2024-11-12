import 'package:flutter/material.dart';

Text textWidget({
  required String title,
  required double size,
  required FontWeight weight,
  required Color color,
}) {
  return Text(
    title,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
    ),
  );
}
