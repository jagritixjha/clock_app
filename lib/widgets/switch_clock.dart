import 'package:clock_app/constants.dart';
import 'package:flutter/material.dart';

class SwitchClock extends StatelessWidget {
  SwitchClock({
    super.key,
    required this.NavigateToScreen,
  });

  Widget NavigateToScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Switch(
        activeColor: Colors.pink,
        trackOutlineColor: WidgetStatePropertyAll(Colors.pink.shade200),
        inactiveThumbColor: Colors.pink.shade500,
        value: isSimpleClock,
        onChanged: (value) {
          isSimpleClock = !isSimpleClock;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavigateToScreen,
            ),
          );
        },
      ),
    );
  }
}
