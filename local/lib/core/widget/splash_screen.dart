import 'package:flutter/material.dart';

import '../../../../core/constant/image_resources.dart';
import '../constant/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(
                ImageResource.logo,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
