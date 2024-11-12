import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:clock_app/constants.dart';
import 'package:clock_app/views/simple_clock_home_screen.dart';
import 'package:clock_app/widgets/clock_ui.dart';
import 'package:clock_app/widgets/select_state.dart';
import 'package:clock_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../widgets/switch_clock.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  DateTime datetime = DateTime.now();
  String meridiem = 'AM';

  void startClock() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        datetime = DateTime.now();
      });
      // print(datetime);
    });

    /*
      Future.delayed(const Duration(seconds: 1)).then((value) {
        setState(() {
          datetime = DateTime.now();
        });
        startClock();
      });
    */
    // print(datetime);
  }

  @override
  void initState() {
    startClock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (datetime.hour >= 12) {
      meridiem = 'PM';
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: null,
        elevation: 10,
        shadowColor: const Color.fromARGB(255, 205, 139, 139),
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        title: const Text(
          "World Clock",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          SwitchClock(
            NavigateToScreen: const SimpleClockScreen(),
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            ClockUi(size: size, datetime: datetime),
            textWidget(
              title: selectedState,
              size: 24,
              color: Colors.pink.shade600,
              weight: FontWeight.w500,
            ),
            textWidget(
              title: '${datetime.hour}:${datetime.minute} $meridiem ',
              size: 40,
              color: const Color(0xC5000000),
              weight: FontWeight.w500,
            ),
            TextButton(
              onPressed: () {
                selectState(context);
              },
              child: textWidget(
                title: 'Select Your State',
                color: Colors.purple.shade300,
                weight: FontWeight.w500,
                size: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
