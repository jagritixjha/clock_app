import 'package:clock_app/constants.dart';
import 'package:flutter/material.dart';

class StrapClock extends StatelessWidget {
  const StrapClock({
    super.key,
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isStrap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // hour strap
          Transform.scale(
            scale: 5,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.black87,
              value: dateTime.hour / 12,
            ),
          ),

          // minute strap
          Transform.scale(
            scale: 4,
            child: CircularProgressIndicator(
              strokeWidth: 1.8,
              color: Colors.purple,
              value: dateTime.minute / 60,
            ),
          ),

          // second strap
          Transform.scale(
            scale: 2,
            child: CircularProgressIndicator(
              strokeWidth: 1.2,
              color: Colors.indigo,
              value: dateTime.second / 60,
            ),
          ),
        ],
      ),
    );
  }
}
