import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  final String activity;
  final String image;
  const Card1({super.key, required this.activity, required this.image});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          width: screenWidth * 0.3,
          height: screenHeight * 0.2,
          child: Stack(
            children: [
              FractionallySizedBox(
                heightFactor: 1.0,
                child: ClipRect(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // Positioned widget for placing text at the bottom left
              Positioned(
                left: 5,
                bottom: 5,
                child: Text(
                  activity,
                  style: const TextStyle(
                      color: Colors.white, // Set text color as needed
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "popR" // Set font size as needed
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
