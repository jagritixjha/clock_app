import 'package:clock_app/constants.dart';
import 'package:clock_app/widgets/switch_clockstyle.dart';
import 'package:clock_app/widgets/text_widget.dart';

import 'package:flutter/material.dart';

class SimpleClockDrawer extends StatefulWidget {
  const SimpleClockDrawer({
    super.key,
  });

  @override
  State<SimpleClockDrawer> createState() => _SimpleClockDrawerState();
}

class _SimpleClockDrawerState extends State<SimpleClockDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 260,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                foregroundImage: AssetImage('assets/user.jpg'),
                radius: 34,
              ),
              const SizedBox(
                height: 12,
              ),
              textWidget(
                title: 'Jagriti Jha',
                weight: FontWeight.w700,
                size: 18,
                color: Colors.black87,
              ),
              const Text(
                'im.jagriti.jha@gmail.com',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              Container(
                height: 20,
                margin: const EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 2,
                      color: Colors.indigo.shade100,
                    ),
                  ),
                ),
              ),
              const Text(
                'Choose clock',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              switchClocks(
                title: 'Strap',
                isActive: isStrap,
                onChanged: (value) => setState(
                  () => isStrap = !isStrap,
                ),
              ),
              switchClocks(
                title: 'Digital',
                isActive: isDigital,
                onChanged: (value) => setState(
                  () => isDigital = !isDigital,
                ),
              ),
              switchClocks(
                title: 'Analog',
                isActive: isAnalog,
                onChanged: (value) => setState(
                  () => isAnalog = !isAnalog,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Choose background color',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 100,
                width: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: background.length,
                  itemBuilder: (context, index) {
                    final Color color = background[index];
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = color;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.only(right: 20),
                            color: color,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
