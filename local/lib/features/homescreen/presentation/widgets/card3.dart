import 'package:flutter/material.dart';

class Card3 extends StatelessWidget {
  final String image;
  const Card3({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 10.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.width * 0.7,
          width: MediaQuery.of(context).size.width * 0.9,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fill)),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.75, top: 15),
                  child: GestureDetector(
                    child: Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(38),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.bookmark_border_rounded,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.825,
                        height: 81,
                        margin: const EdgeInsets.only(
                          top: 150,
                          left: 10,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, top: 7),
                                  child: Text(
                                    "Mid Kitchen",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 160, top: 7),
                                  child: Container(
                                    height: 18,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      color: Colors.green[800],
                                    ),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "4.3",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 3),
                                        Icon(Icons.star,
                                            size: 13, color: Colors.white),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "1512 Sherman Ave, Evanston",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 70),
                                    child: Text(
                                      "8.1 miles",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 9),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Mediterranean • Salads",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 90),
                                    child: Text(
                                      "\$85 for two",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
