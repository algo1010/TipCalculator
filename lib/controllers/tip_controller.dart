import 'package:calculator/config/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Tip {
  none,
  tenPercent,
  fifteenPercent,
  twentyPercent,
  custom,
}

class TipController extends GetxController {
  var selectedTip = Tip.tenPercent.obs;
  var customTipValue = 0.obs;

  Color get tenPercentBackgroundColor => selectedTip.value == Tip.tenPercent
      ? ThemeColor.secondary
      : ThemeColor.primary;

  Color get fifteenPercentBackgroundColor =>
      selectedTip.value == Tip.fifteenPercent
          ? ThemeColor.secondary
          : ThemeColor.primary;

  Color get twentyPercentBackgroundColor =>
      selectedTip.value == Tip.twentyPercent
          ? ThemeColor.secondary
          : ThemeColor.primary;

  Color get customPercentBackgroundColor => selectedTip.value == Tip.custom
      ? ThemeColor.secondary
      : ThemeColor.primary;

  void selectTip({required Tip tip}) {
    selectedTip.value = tip;
    update();
  }
}
