import 'package:calculator/config/theme_font.dart';
import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  final String topTitle;
  final String bottomTitle;

  const HeaderComponent({
    super.key,
    required this.topTitle,
    required this.bottomTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(topTitle, style: ThemeFont.bold(fontSize: 18)),
        Text(bottomTitle, style: ThemeFont.regular(fontSize: 16))
      ],
    );
  }
}
