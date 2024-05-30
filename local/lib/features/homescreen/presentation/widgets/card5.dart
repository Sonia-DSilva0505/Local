import 'package:flutter/material.dart';

class Card5 extends StatelessWidget {
  final String image;
  final String text;
  const Card5({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: ClipPath(
            clipper: ImageClipper(),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.25); // Start at the bottom-left corner of the semicircle
    path.quadraticBezierTo(
      size.width * 0.5,
      0,
      size.width,
      size.height * 0.25,
    ); // Draw the semicircle on the top
    path.lineTo(size.width, size.height* 0.75); // Draw a straight line to the bottom-right corner
    path.lineTo(0, size.height* 0.75); // Draw a straight line to the bottom-left corner
    path.close(); // Close the path to complete the shape

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}