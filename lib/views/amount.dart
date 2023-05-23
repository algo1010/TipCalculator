import 'package:calculator/config/theme_color.dart';
import 'package:calculator/config/theme_font.dart';
import 'package:flutter/material.dart';

class AmountComponent extends StatelessWidget {
  final String title;
  final String amount;
  final CrossAxisAlignment alignment;

  const AmountComponent(
      {super.key,
      required this.title,
      required this.amount,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(title, style: ThemeFont.demibold(fontSize: 18)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('\$',
                style: ThemeFont.bold(fontSize: 16, color: ThemeColor.primary)),
            Text(amount,
                style: ThemeFont.bold(fontSize: 24, color: ThemeColor.primary)),
          ],
        )
      ],
    );
  }
}
