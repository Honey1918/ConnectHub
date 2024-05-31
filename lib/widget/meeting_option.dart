import 'package:flutter/material.dart';
import 'package:zoom_clone/util/colors.dart';

class MeetingOption extends StatelessWidget {
  const MeetingOption(
      {super.key,
      required this.text,
      required this.ismute,
      required this.onchange});
  final String text;
  final bool ismute;
  final Function(bool) onchange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Switch.adaptive(value: ismute, onChanged: onchange),
        ],
      ),
    );
  }
}
