import 'dart:math';

import 'package:clock_app/constants.dart';
import 'package:flutter/material.dart';

class AnalogClock extends StatelessWidget {
  const AnalogClock({
    super.key,
    required this.size,
    required this.dateTime,
  });

  final Size size;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isAnalog,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...List.generate(
            60,
            (index) => Transform.rotate(
              angle: index * pi * 2 / 60,
              child: Divider(
                endIndent:
                    index % 5 == 0 ? size.width * 0.87 : size.width * 0.88,
                thickness: 2,
                color: index % 5 == 0
                    ? Colors.orange.shade700
                    : Colors.indigo.shade600,
              ),
            ),
          ),

          // hour hand
          Transform.rotate(
            angle: pi / 2,
            child: Transform.rotate(
              angle: dateTime.hour * (pi * 2) / 12,
              child: Divider(
                indent: 50,
                endIndent: size.width * 0.5 - 16,
                color: Colors.black87,
                thickness: 4,
              ),
            ),
          ),

          // minute hand
          Transform.rotate(
            angle: pi / 2,
            child: Transform.rotate(
              angle: dateTime.minute * (pi * 2) / 60,
              child: Divider(
                indent: 50,
                endIndent: size.width * 0.5 - 16,
                color: Colors.purple,
                thickness: 3,
              ),
            ),
          ),

          // second hand
          Transform.rotate(
            angle: pi / 2,
            child: Transform.rotate(
              angle: dateTime.second * (pi * 2) / 60,
              child: Divider(
                indent: 20,
                endIndent: size.width * 0.5 - 16,
                color: Colors.indigo,
                thickness: 3,
              ),
            ),
          ),
          const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 2,
          )
        ],
      ),
    );
  }
}
