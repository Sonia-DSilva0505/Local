import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class CommonBookmarkButton extends StatelessWidget {
  const CommonBookmarkButton(
      {super.key,required this.iconsize, this.isBookmarked = false, this.onPressed});
  final double iconsize;
  final bool isBookmarked;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark,
        color: isBookmarked ? AppColors.primary : AppColors.cardComponentColor1,
      ),
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      splashRadius: 24.0,
      constraints: const BoxConstraints(
        minWidth: 24.0,
        minHeight: 24.0,
      ),
      iconSize: iconsize,
      visualDensity: VisualDensity.compact,
      alignment: Alignment.center,
    );
  }
}
