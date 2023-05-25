import '../config/theme_color.dart';
import '../config/theme_font.dart';
import '../controllers/bill_controller.dart';
import '../views/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillInputComponent extends StatelessWidget {
  const BillInputComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
            width: 68,
            child: HeaderComponent(
              topTitle: 'Enter',
              bottomTitle: 'your bill',
            )),
        const SizedBox(width: 16),
        Expanded(child: GetBuilder<BillController>(builder: (controller) {
          final TextStyle style = controller.isShowErrorMessage.value
              ? ThemeFont.bold(fontSize: 35, color: Colors.white)
              : ThemeFont.bold(fontSize: 35);
          return Container(
              decoration: BoxDecoration(
                color: controller.isShowErrorMessage.value
                    ? ThemeColor.error
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: 68,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('\$', style: style),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                            enableInteractiveSelection: false,
                            controller: controller.textController,
                            style: style,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true)),
                      )
                    ],
                  ),
                ),
              ));
        }))
      ],
    );
  }
}
