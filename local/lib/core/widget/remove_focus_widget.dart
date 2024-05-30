import 'package:flutter/material.dart';

class RemoveFocusWidget extends StatelessWidget {
  final Widget child;

  const RemoveFocusWidget({super.key, required this.child});

  void _removeFocus(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _removeFocus(context);
      },
      child: FocusScope(
        child: child,
        onFocusChange: (hasFocus) {
          if (!hasFocus) {
            _removeFocus(context);
          }
        },
      ),
    );
  }
}
