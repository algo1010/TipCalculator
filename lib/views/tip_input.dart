import '../common/input_popup.dart';
import '../controllers/tip_controller.dart';
import '../utils/utils.dart';
import '../views/header.dart';
import '../common/tip_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TipInputComponent extends StatelessWidget {
  const TipInputComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: SizedBox(
              width: 68,
              child: HeaderComponent(
                topTitle: 'Choose',
                bottomTitle: 'your tip',
              )),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GetBuilder<TipController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 50,
                      child: TipButton(
                        title: createTipTitle(value: '10', sufix: '%'),
                        onTapped: () {
                          controller.selectTip(tip: Tip.tenPercent);
                        },
                        backgroundColor: controller.tenPercentBackgroundColor,
                      ),
                    )),
                    const SizedBox(width: 10),
                    Expanded(
                        child: SizedBox(
                      height: 50,
                      child: TipButton(
                        title: createTipTitle(value: '15', sufix: '%'),
                        onTapped: () {
                          controller.selectTip(tip: Tip.fifteenPercent);
                        },
                        backgroundColor:
                            controller.fifteenPercentBackgroundColor,
                      ),
                    )),
                    const SizedBox(width: 10),
                    Expanded(
                        child: SizedBox(
                      height: 50,
                      child: TipButton(
                        title: createTipTitle(value: '20', sufix: '%'),
                        onTapped: () {
                          controller.selectTip(tip: Tip.twentyPercent);
                        },
                        backgroundColor:
                            controller.twentyPercentBackgroundColor,
                      ),
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                    height: 50,
                    child: TipButton(
                      title: createTipTitle(
                        value: controller.customTipText,
                        sufix: controller.customTipSuffix,
                      ),
                      onTapped: () {
                        showCustomTipPopup();
                      },
                      backgroundColor: controller.customPercentBackgroundColor,
                    )),
              ],
            );
          }),
        ),
      ],
    );
  }

  void showCustomTipPopup() {
    Get.dialog(
      InputPopup(
        title: 'Enter your tip',
        onChoose: (int percent) {
          final controller = Get.find<TipController>();
          controller.selectTip(tip: Tip.custom, percent: percent);
        },
      ),
      barrierDismissible: true,
    );
  }
}
