import 'dart:async';
import 'dart:core';

import 'package:clock_app/constants.dart';
import 'package:clock_app/views/clock_screen_with_ui.dart';
import 'package:clock_app/widgets/analog_clock.dart';
import 'package:clock_app/widgets/digital_clock.dart';
import 'package:clock_app/widgets/simple_clock_drawer.dart';
import 'package:clock_app/widgets/strap_clock.dart';
import 'package:clock_app/widgets/switch_clock.dart';
import 'package:clock_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SimpleClockScreen extends StatefulWidget {
  const SimpleClockScreen({super.key});

  @override
  State<SimpleClockScreen> createState() => _SimpleClockScreenState();
}

class _SimpleClockScreenState extends State<SimpleClockScreen> {
  DateTime dateTime = DateTime.now();

  void startClock() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
  }

  @override
  void initState() {
    startClock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: selectedColor,
      appBar: AppBar(
        backgroundColor: selectedColor,
        title: textWidget(
          title: 'Clock App',
          weight: FontWeight.w700,
          size: 22,
          color: Colors.black87,
        ),
        centerTitle: true,
        actions: [
          SwitchClock(NavigateToScreen: const ClockScreen()),
        ],
      ),
      drawer: const SimpleClockDrawer(),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Analog clock
            AnalogClock(size: size, dateTime: dateTime),

            // Strap clock
            StrapClock(dateTime: dateTime),

            // Digital clock
            DigitalClock(dateTime: dateTime)
          ],
        ),
      ),
    );
  }
}
