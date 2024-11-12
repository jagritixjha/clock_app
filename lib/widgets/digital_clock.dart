import 'package:clock_app/constants.dart';
import 'package:flutter/material.dart';

class DigitalClock extends StatelessWidget {
  const DigitalClock({
    super.key,
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isDigital,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 50,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: '${dateTime.hour}',
                  ),
                  TextSpan(
                    text: ' : ',
                    style: TextStyle(
                      color: Colors.orange.shade700,
                    ),
                  ),
                  TextSpan(
                    text: '${dateTime.minute}',
                    style: TextStyle(
                      color: Colors.purple.shade400,
                    ),
                  ),
                  TextSpan(
                    text: ' : ',
                    style: TextStyle(
                      color: Colors.orange.shade700,
                    ),
                  ),
                  TextSpan(
                    text: '${dateTime.second}',
                    style: TextStyle(
                      color: Colors.indigo.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
