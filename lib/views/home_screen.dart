import 'dart:async';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAnalog = false;
  bool _isStrap = false;
  bool _isDigital = false;
  String selectedImage = '';
  DateTime dateTime = DateTime.now();

  List<String> background = [
    'https://images.unsplash.com/photo-1550895030-823330fc2551?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGJhY2tncm91bmQlMjB0ZXh0dXJlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1550895030-823330fc2551?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGJhY2tncm91bmQlMjB0ZXh0dXJlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1550895030-823330fc2551?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGJhY2tncm91bmQlMjB0ZXh0dXJlfGVufDB8fDB8fHww',
    //  'https://images.unsplash.com/photo-1517384084767-6bc118943770?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nzh8fGJhY2tncm91bmQlMjB0ZXh0dXJlfGVufDB8fDB8fHww'
  ];

  void startClock() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      dateTime = DateTime.now();
      setState(() {});
      startClock();
    });
  }

  @override
  // void initState() {
  //   startClock();
  //   print(dateTime);
  //   print(dateTime);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clock App',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
          width: 260,
          backgroundColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/user.jpg'),
                  backgroundColor: Colors.white,
                ),
                currentAccountPictureSize: Size.fromRadius(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                accountName: Text(
                  'Jagriti Jha',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
                accountEmail: Text(
                  'im.jagriti.jha@gmail.com',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      isActive: _isStrap,
                      onChanged: (value) => setState(
                        () => _isStrap = !_isStrap,
                      ),
                    ),
                    switchClocks(
                      title: 'Digital',
                      isActive: _isDigital,
                      onChanged: (value) => setState(
                        () => _isDigital = !_isDigital,
                      ),
                    ),
                    switchClocks(
                      title: 'Analog',
                      isActive: _isAnalog,
                      onChanged: (value) => setState(
                        () => _isAnalog = !_isAnalog,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Choose Wallpaper',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 100,
                      width: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: background.length,
                        itemBuilder: (context, index) {
                          final String image = background[index];
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedImage = image;
                                  });
                                },
                                child: Container(
                                  height: 110,
                                  width: 100,
                                  margin: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(selectedImage),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Analog clock
              Visibility(
                visible: _isAnalog,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ...List.generate(
                      60,
                      (index) => Transform.rotate(
                        angle: index * pi * 2 / 60,
                        child: Divider(
                          endIndent: index % 5 == 0
                              ? size.width * 0.87
                              : size.width * 0.88,
                          thickness: 2,
                          color: index % 5 == 0
                              ? Colors.black
                              : Colors.purple.shade100,
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
              ),

              // Strap clock
              Visibility(
                visible: _isStrap,
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
              ),

              // Digital clock
              Visibility(
                  visible: _isDigital,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 28,
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
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Row switchClocks(
      {required String title,
      required bool isActive,
      required ValueChanged<bool> onChanged}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        Switch(value: isActive, onChanged: onChanged)
      ],
    );
  }
}
