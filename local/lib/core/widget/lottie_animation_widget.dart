import 'package:flutter/material.dart';

class LottieAnimationWidget extends StatelessWidget {
  final String animationPath; 
  final double height; 
  final double width; 

  const LottieAnimationWidget({super.key, 
    required this.animationPath,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: const Center(child: Text('Nothing to show here'),),
      // Lottie.asset(
      //   animationPath,
      //   fit: BoxFit.contain,
      //   frameBuilder: (context, child, composition)  {
      //     if (composition == null) {
      //       return const CircularProgressIndicator();
      //     }
      //     return child;
      //   },
      // ),
    );
  }
}
