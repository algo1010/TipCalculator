import 'dart:io';

import 'package:calculator/config/theme_font.dart';
import 'package:calculator/views/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
                  Text('\$', style: ThemeFont.bold(fontSize: 35)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      style: ThemeFont.bold(fontSize: 35),
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      keyboardType: Platform.isIOS
                          ? const TextInputType.numberWithOptions(
                              signed: true, decimal: true)
                          : TextInputType.number,
// This regex for only amount (price). you can create your own regex based on your requirement
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d'))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ))
      ],
    );
  }
}
