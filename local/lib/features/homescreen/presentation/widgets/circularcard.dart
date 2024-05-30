import 'package:flutter/material.dart';

class Ccard extends StatelessWidget {
  final String image;
  final String text;
  const Ccard({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double circleSize = screenWidth * 0.3;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(circleSize / 2),
      ),
      child: SizedBox(
        width: circleSize,
        height: circleSize,
        child: Stack(
          children: [
            FractionallySizedBox(
              heightFactor: 1.0,
              child: ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: "popR",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
