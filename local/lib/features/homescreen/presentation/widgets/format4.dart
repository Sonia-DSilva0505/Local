import 'cardlist.dart';
import 'package:flutter/material.dart';

class Format4 extends StatelessWidget {
  const Format4({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: screenHeight * 0.07,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const Clist(
              image: "assets/demo.jpg",
              text: "Hello",
            );
          },
        ),
      ),
    );
  }
}
