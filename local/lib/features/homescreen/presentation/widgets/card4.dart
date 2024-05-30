import 'package:flutter/material.dart';

class Card4 extends StatelessWidget {
  final String image;
  const Card4({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              height: 201.71,
              width: 172.31,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(17.02),
                      topRight: Radius.circular(17.02)),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Container(
              height: 28.05,
              width: 172.31,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(17.02),
                    bottomRight: Radius.circular(17.02)),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "165.5k Likes",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Icon(
                      Icons.favorite_outlined,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      "4.9",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
