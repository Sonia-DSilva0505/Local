import 'package:flutter/material.dart';
import 'package:local/features/homescreen/presentation/widgets/cardlist.dart';
import 'package:local/features/homescreen/presentation/widgets/divider_text.dart';

import '../widgets/card4.dart';
import '../widgets/card6.dart';
import '../widgets/format2.dart';
import '../widgets/searchbar.dart';

class EntertainmentPage extends StatelessWidget {
  const EntertainmentPage({super.key});
  static const String routeName = 'EntertainmentPage';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Sbar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const FilterCard(
                    text: "Filter",
                  );
                },
              ),
            ),
          ),
          const DividerText(text: "POPULAR EVENTS"),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.7,
            width: MediaQuery.of(context).size.width * 0.95,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const Card6(
                  image: "assets/cafe.jpeg",
                  bookmark: false,
                );
              },
            ),
          ),
          const DividerText(text: "RECOMMENDED MOVIES"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const Card4(
                  image: "assets/movie.jpg",
                );
              },
            ),
          ),
          const Format2(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return const Card6(
                image: "assets/cafe.jpeg",
                bookmark: true,
              );
            },
          ),
           SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const Card4(
                  image: "assets/movie.jpg",
                );
              },
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return const Card6(
                image: "assets/cafe.jpeg",
                bookmark: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
