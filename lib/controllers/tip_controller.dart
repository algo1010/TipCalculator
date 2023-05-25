import '../config/theme_color.dart';
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
  var selectedTip = Tip.none.obs;
  var customTipValue = 0.obs;
  var tipValue = 0.0.obs;

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

  String get customTipText =>
      selectedTip.value == Tip.custom ? customTipValue.string : 'Custom tip';

  String? get customTipSuffix => selectedTip.value == Tip.custom ? '%' : null;

  void selectTip({required Tip tip, int? percent}) {
    selectedTip.value = tip;
    switch (tip) {
      case Tip.tenPercent:
        tipValue.value = 0.1;
        break;
      case Tip.fifteenPercent:
        tipValue.value = 0.15;
        break;
      case Tip.twentyPercent:
        tipValue.value = 0.2;
        break;
      case Tip.custom:
        customTipValue.value = percent ?? 0;
        tipValue.value = percent != null ? percent / 100.0 : 0.0;
        break;
      default:
    }
    update();
  }
}
