import 'package:flutter/material.dart';

class Card6 extends StatelessWidget {
  final String image;
  final bool bookmark;
  const Card6({
    super.key,
    required this.image,
    required this.bookmark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.88,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fill)),
            child: Stack(
              children: [
                bookmark
                    ? Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.75,
                            top: 15),
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
                      )
                    : const SizedBox.shrink(),
                Positioned.fill(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.19),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.83,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, top: 7),
                                  child: Text(
                                    "Mid Kitchen",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    "1512 Sherman Ave, Evanston",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
