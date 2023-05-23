import 'dart:math';

import 'package:calculator/controllers/result_controller.dart';
import 'package:calculator/controllers/split_controller.dart';
import 'package:calculator/controllers/tip_controller.dart';
import 'package:calculator/views/bill_input.dart';
import 'package:calculator/views/logo.dart';
import 'package:calculator/views/result.dart';
import 'package:calculator/views/spit_input.dart';
import 'package:calculator/views/tip_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject Result controller for result component
    Get.put(ResultController());
    // Inject Split controller for split component
    Get.put(SplitController());
    // Inject Split controller for split component
    Get.put(TipController());

    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 243, 244),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 40),
            child: Column(
              children: [
                Logo(),
                SizedBox(height: 30),
                ResultComponent(),
                SizedBox(height: 30),
                BillInputComponent(),
                SizedBox(height: 30),
                TipInputComponent(),
                SizedBox(height: 30),
                SplitInputComponent()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
