import 'package:calculator/config/theme_color.dart';
import 'package:calculator/config/theme_font.dart';
import 'package:calculator/controllers/result_controller.dart';
import 'package:calculator/views/amount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultComponent extends StatelessWidget {
  const ResultComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final ResultController controller = Get.find();
    return Container(
      constraints: const BoxConstraints.expand(height: 225),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text('Total p/person', style: ThemeFont.demibold(fontSize: 18)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '\$',
                  style: ThemeFont.bold(fontSize: 24),
                ),
                Obx(() => Text(
                      controller.totalPerPerson.toString(),
                      style: ThemeFont.bold(fontSize: 48),
                    )),
              ],
            ),
            const Spacer(),
            Divider(color: ThemeColor.separator, thickness: 2),
            const Spacer(),
            Row(
              children: [
                Obx(() => AmountComponent(
                      title: 'Total bill',
                      amount: controller.totalBillText,
                      alignment: CrossAxisAlignment.start,
                    )),
                const Spacer(),
                Obx(() => AmountComponent(
                      title: 'Total tip',
                      amount: controller.totalTipText,
                      alignment: CrossAxisAlignment.end,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
