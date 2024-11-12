import 'package:flutter/material.dart';

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
      Switch(
        activeColor: Colors.indigo.shade900,
        inactiveTrackColor: Colors.grey.shade100,
        inactiveThumbColor: Colors.purple.shade900,
        overlayColor:
            MaterialStatePropertyAll(Colors.purple.shade900.withOpacity(0.2)),
        splashRadius: 22,
        thumbIcon: const MaterialStatePropertyAll(
          Icon(
            Icons.access_time_rounded,
            color: Colors.white,
          ),
        ),
        trackOutlineColor: const MaterialStatePropertyAll(Colors.black),
        value: isActive,
        onChanged: onChanged,
      )
    ],
  );
}
