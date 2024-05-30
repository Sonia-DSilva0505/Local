import 'package:flutter/material.dart';
import '../constant/image_resources.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Image.asset(
          ImageResource.logo,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
