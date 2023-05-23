import 'package:flutter/material.dart';
import '../config/theme_color.dart';

class TipButton extends StatelessWidget {
  final Widget title;
  final VoidCallback onTapped;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final bool isEnable;

  const TipButton({
    super.key,
    required this.title,
    required this.onTapped,
    this.backgroundColor,
    this.borderRadius,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnable ? 1.0 : 0.5,
      child: InkWell(
        onTap: isEnable ? onTapped : null,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? ThemeColor.primary,
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
          child: Center(
            child: title,
          ),
        ),
      ),
    );
  }
}
