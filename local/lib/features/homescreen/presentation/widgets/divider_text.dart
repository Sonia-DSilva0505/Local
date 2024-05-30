import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  final String text;
  const DividerText({
    super.key,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Divider(
                color: Color(0xFF999999),
                thickness: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontFamily: "popR"),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Divider(
                color: Color(0xFF999999),
                thickness: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
