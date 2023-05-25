import '../config/theme_font.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icCalculatorBW.png',
          fit: BoxFit.contain,
          width: 60,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Mr', style: ThemeFont.regular(fontSize: 20)),
                Text('TIP', style: ThemeFont.bold(fontSize: 24))
              ],
            ),
            Text('Calculator', style: ThemeFont.demibold(fontSize: 20)),
          ],
        )
      ],
    );
  }
}
