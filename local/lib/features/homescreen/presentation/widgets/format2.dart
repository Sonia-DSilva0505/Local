import 'package:flutter/material.dart';
import 'card1.dart';
import 'card2.dart';
import 'divider_text.dart';

class Format2 extends StatelessWidget {
  const Format2({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DividerText(text: "WHAT ARE YOU IN A MOOD FOR?"),
          SizedBox(
            width: screenWidth * 1,
            // height: screenHeight * 0.35,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card1(
                      activity: 'Comedy',
                      image: "assets/demo.jpg",
                    ),
                    Card2(
                      activity: 'Music Shows',
                      image: "assets/demo.jpg",
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card2(
                      activity: 'Games',
                      image: "assets/demo.jpg",
                    ),
                    Card1(
                      activity: 'Drama & Acts',
                      image: "assets/demo.jpg",
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card2(
                      activity: 'Sports',
                      image: "assets/demo.jpg",
                    ),
                    Card1(
                      activity: 'Movies',
                      image: "assets/demo.jpg",
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
