import 'package:flutter/material.dart';

import '../config/theme_font.dart';

Text createTipTitle(
    {required String value,
    String? sufix,
    Color foregroundColor = Colors.white}) {
  return Text.rich(
    TextSpan(children: [
      TextSpan(
          text: value,
          style: ThemeFont.bold(
            fontSize: 24,
            color: Colors.white,
          )),
      if (sufix != null)
        TextSpan(
            text: sufix,
            style: ThemeFont.bold(
              fontSize: 18,
              color: Colors.white,
            ))
    ]),
  );
}
