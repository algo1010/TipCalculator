import 'package:calculator/controllers/tip_controller.dart';
import 'package:calculator/utils/utils.dart';
import 'package:calculator/views/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/tip_button.dart';

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
                      title: createTipTitle(value: 'Custom tip'),
                      onTapped: () {
                        controller.selectTip(tip: Tip.custom);
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
}
