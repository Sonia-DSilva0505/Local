import 'package:flutter/material.dart';
import 'package:local/core/constant/app_colors.dart';

class Clist extends StatelessWidget {
  const Clist({super.key, required this.text, required this.image});
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
            color: Colors.white, width: 1), // Border color and width
      ),
      child: SizedBox(
        width: screenWidth * 0.2,
        height: screenHeight * 0.07,
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
            // Align widget for centering the text
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "popR",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterCard extends StatelessWidget {
  final String text;
  const FilterCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Card(
      color: AppColors.black,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
            color: Colors.white, width: 1), // Border color and width
      ),
      child: SizedBox(
        width: screenWidth * 0.2,
        height: screenHeight * 0.07,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: "popR",
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
