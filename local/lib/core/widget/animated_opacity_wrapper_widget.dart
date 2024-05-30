import 'package:flutter/material.dart';

class OpacityWrapper extends StatelessWidget {
  final bool visible;
  final Widget child;

  const OpacityWrapper(
      {super.key,
      required this.visible,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1 : 0.45,
      duration: const Duration(milliseconds: 300),
      child: child,
    );
  }
}
