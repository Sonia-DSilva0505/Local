import 'package:flutter/material.dart';

class FadeAnimationWidget extends StatefulWidget {
  final bool shouldFadeIn;
  final Widget child;

  const FadeAnimationWidget({
    super.key,
    required this.shouldFadeIn,
    required this.child,
  });

  @override
  State<FadeAnimationWidget> createState() => _FadeAnimationWidgetState();
}

class _FadeAnimationWidgetState extends State<FadeAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    updateAnimation();
  }

  @override
  void didUpdateWidget(FadeAnimationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.shouldFadeIn != oldWidget.shouldFadeIn) {
      updateAnimation();
    }
  }

  void updateAnimation() {
    if (widget.shouldFadeIn) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
