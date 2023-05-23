import 'package:calculator/config/theme_font.dart';
import 'package:calculator/controllers/split_controller.dart';
import 'package:calculator/views/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/tip_button.dart';

class SplitInputComponent extends StatelessWidget {
  const SplitInputComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final SplitController controller = Get.find();
    return Row(
      children: [
        const SizedBox(
          width: 68,
          child: HeaderComponent(
            topTitle: 'Split',
            bottomTitle: 'the total',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
            child: SizedBox(
          height: 50,
          child: Row(
            children: [
              SizedBox(
                width: 60,
                child: GetBuilder<SplitController>(builder: (controller) {
                  return TipButton(
                    isEnable: controller.decrementButtonEnable.value,
                    title: Text(
                      '-',
                      style: ThemeFont.bold(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    onTapped: controller.decrement,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                  );
                }),
              ),
              Expanded(
                child: TipButton(
                  title: Obx(() => Text(
                        controller.count.string,
                        style: ThemeFont.bold(fontSize: 24),
                      )),
                  onTapped: () {},
                  backgroundColor: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              SizedBox(
                width: 60,
                child: GetBuilder<SplitController>(builder: (controller) {
                  return TipButton(
                    isEnable: controller.incrementButtonEnable.value,
                    title: Text('+',
                        style: ThemeFont.bold(
                          fontSize: 24,
                          color: Colors.white,
                        )),
                    onTapped: controller.increment,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  );
                }),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
