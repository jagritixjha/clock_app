import 'package:clock_app/constants.dart';
import 'package:flutter/material.dart';

Future selectState(BuildContext context) {
  return showModalBottomSheet(
    showDragHandle: true,
    useSafeArea: true,
    context: context,
    builder: (context) => ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: states.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            selectedState = states[index];
            Navigator.pop(context);
          },
          child: Container(
            height: 40,
            alignment: Alignment.center,
            child: Text(
              states[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: selectedState == states[index] ? Colors.pink : null,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey.shade200,
        height: 6,
      ),
    ),
  );
}
