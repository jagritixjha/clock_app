import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

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
    });
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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.grey.shade300,
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
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: size.width,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20, bottom: 40),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // inner circle // dials
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 400,
                    width: size.width - 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Color(0xFFEEF1F9),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 241, 241, 255),
                        Color.fromARGB(255, 253, 253, 255),
                      ]),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(16, 18),
                          color: Color(0xE0d2d8ea),
                          blurRadius: 16,
                          spreadRadius: -8,
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ...List.generate(
                          60,
                          (index) => Transform.rotate(
                            angle: index * pi * 2 / 24,
                            child: Divider(
                              color: Colors.black,
                              height: 10,
                              indent: size.width * 0.8,
                              endIndent: 11,
                              thickness: 4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // upper circle // hour, minute & second hands
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    height: 246,
                    width: size.width - 6,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(10, 10),
                          color: Color.fromARGB(247, 216, 219, 230),
                          blurRadius: 10,
                          spreadRadius: -6,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Transform.rotate(
                          angle: pi / 2,
                          child: Transform.rotate(
                            angle: datetime.second * (pi * 2) / 60,
                            child: Divider(
                              color: Colors.pink,
                              indent: 50,
                              endIndent: size.width / 2.2,
                              thickness: 4,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: pi / 2,
                          child: Transform.rotate(
                            angle: datetime.minute * (pi * 2) / 60,
                            child: Divider(
                              indent: 100,
                              endIndent: size.width / 2.2,
                              color: Colors.black,
                              thickness: 4,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: pi / 2,
                          child: Transform.rotate(
                            angle: datetime.hour * (pi * 2) / 24,
                            child: Divider(
                              color: Colors.purple.shade300,
                              thickness: 4,
                              indent: 120,
                              endIndent: size.width / 2.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // pink circle in center
                Align(
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.pink.shade600,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Mumbai',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.pink.shade600,
            ),
          ),
          Text(
            '${datetime.hour}:${datetime.minute} $meridiem ',
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: Color(0xC5000000),
            ),
          ),
        ],
      ),
    );
  }
}
