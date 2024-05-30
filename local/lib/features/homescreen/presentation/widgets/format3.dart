import 'circularcard.dart';
import 'package:flutter/material.dart';
import 'divider_text.dart';

class Format3 extends StatelessWidget {
  const Format3({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth * 1,
      height: screenHeight * 0.28,
      child: Column(
        children: [
          const DividerText(text: "DISCOVER WITH VIBE"),
          SizedBox(
            width: screenWidth * 1,
            height: screenHeight * 0.20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 23.0),
                  child: Ccard(
                    image: "assets/demo.jpg",
                    text: "Salon",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
