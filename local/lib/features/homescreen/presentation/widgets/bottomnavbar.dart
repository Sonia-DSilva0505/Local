import 'package:local/features/homescreen/presentation/pages/entertainment.dart';
import 'package:local/features/homescreen/presentation/pages/home.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../chatscreen/presentation/pages/chat.dart';
import 'format2.dart';
import 'format3.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _index = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const EntertainmentPage(),
    const ChatScreen(),
    const Format2(),
    const Format3(),
  ];

  final items = <Widget>[
    const Icon(
      Icons.home,
      size: 25,
    ),
    const Icon(
      Icons.card_giftcard,
      size: 25,
    ),
    const Icon(
      Icons.send,
      size: 25,
    ),
    const Icon(
      Icons.wallet,
      size: 25,
    ),
    const Icon(
      Icons.account_circle,
      size: 25,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.homePageBg,
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.account_circle_rounded,
            color: Colors.red,
            size: 35,
          )
        ],
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Evanston Downtown",
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: false,
        backgroundColor: AppColors.homePageBg,
        leading: const Icon(
          Icons.location_on,
          color: Colors.red,
        ),
        titleSpacing: -10,
      ),
      body: Stack(
        children: [
          Positioned.fill(
              bottom: 15,
              child: IndexedStack(
                index: _index,
                children: _screens,
              ))
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          color: const Color(0xFF1C1C1C),
          buttonBackgroundColor: const Color(0xFFFE3044),
          backgroundColor: Colors.transparent,
          items: items,
          height: 60,
          index: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
        ),
      ),
    );
  }
}
