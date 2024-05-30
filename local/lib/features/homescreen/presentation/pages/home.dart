import 'package:flutter/material.dart';
import 'package:local/features/homescreen/presentation/widgets/card3.dart';
import 'package:local/features/homescreen/presentation/widgets/card5.dart';
import 'package:local/features/homescreen/presentation/widgets/format1.dart';
import '../widgets/divider_text.dart';
import '../widgets/format3.dart';
import '../widgets/format4.dart';
import '../widgets/searchbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Sbar(),
        const Format4(),
        const DividerText(text: "IN THE LIMELIGHT"),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.7,
          width: MediaQuery.of(context).size.width * 0.95,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return const Card3(
                image: "assets/cafe.jpeg",
              );
            },
          ),
        ),
        const Format1(),
        const DividerText(text: "MUST TRIES IN CHICAGO"),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.7,
          width: MediaQuery.of(context).size.width * 0.95,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return const Card5(
                text: "The Bean",
                image: "assets/bean2.jpg",
              );
            },
          ),
        ),
        const DividerText(text: "FEATURED PLACES AROUND YOU"),
        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
              child: Card3(
                image: "assets/cafe3.jpeg",
              ),
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Format3(),
        ),
        const DividerText(text: "CHECK OUT THESE AMAZING PLACES"),
        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
              child: Card3(
                image: "assets/cafe2.jpeg",
              ),
            );
          },
        ),
      ],
    ));
  }
}
