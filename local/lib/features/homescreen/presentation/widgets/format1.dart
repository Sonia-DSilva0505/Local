import 'package:flutter/material.dart';
import 'card1.dart';
import 'card2.dart';
import 'divider_text.dart';

class Format1 extends StatelessWidget {
  const Format1({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth * 1,
      height: screenHeight * 0.53,
      child: Column(
        children: [
          const DividerText(text: "WHAT ARE YOU LOOKING FOR?"),
          SizedBox(
            width: screenWidth * 1,
            height: screenHeight * 0.45,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Card1(
                      activity: 'Valentines Day',
                      image: "assets/demo.jpg",
                    ),
                    Card1(
                      activity: 'Drink & Dine',
                      image: "assets/demo.jpg",
                    )
                  ],
                ),
                Column(
                  children: [
                    Card2(
                      activity: 'Cafe & Bakery',
                      image: "assets/demo.jpg",
                    ),
                    Card2(
                      activity: 'Stand ups',
                      image: "assets/demo.jpg",
                    ),
                    Card1(
                      activity: 'Concerts',
                      image: "assets/demo.jpg",
                    )
                  ],
                ),
                Column(
                  children: [
                    Card1(
                      activity: 'Movies',
                      image: "assets/demo.jpg",
                    ),
                    Card2(
                      activity: 'Salons',
                      image: "assets/demo.jpg",
                    ),
                    Card2(
                      activity: 'Bars',
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
