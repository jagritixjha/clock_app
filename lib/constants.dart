import 'package:flutter/material.dart';

bool isSimpleClock = false;
String selectedState = 'Delhi (NCT)';
Color selectedColor = Colors.white;
bool isAnalog = false;
bool isStrap = true;
bool isDigital = false;

List<String> states = [
  'Andhra Pradesh',
  'Arunachal Pradesh',
  'Assam',
  'Bihar',
  'Chhattisgarh',
  'Goa',
  'Gujarat',
  'Haryana',
  'Himachal Pradesh',
  'Jharkhand',
  'Karnataka',
  'Kerala',
  'Maharashtra',
  'Madhya Pradesh',
  'Manipur',
  'Mizoram',
  'Nagaland',
  'Odisha',
  'Punjab',
  'Rajasthan',
  'Sikkim',
  'Tamil Nadu',
  'Tripura',
  'Telangana',
  'Uttar Pradesh',
  'Uttarakhand',
  'West Bengal',
  'Andaman & Nicobar (UT)',
  'Chandigarh (UT)',
  'Dadra & Nagar Haveli and Daman & Diu (UT)',
  'Delhi (NCT)',
  'Jammu & Kashmir (UT)',
  'Ladakh (UT)',
  'Lakshadweep (UT)',
  'Puducherry (UT)',
];

List<Color> background = [
  Colors.lightBlue.shade400,
  const Color.fromARGB(255, 140, 132, 109),
  Colors.lightGreen.shade200,
];
