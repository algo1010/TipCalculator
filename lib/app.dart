import './controllers/bill_controller.dart';
import './controllers/result_controller.dart';
import './controllers/split_controller.dart';
import './controllers/tip_controller.dart';
import './views/bill_input.dart';
import './views/logo.dart';
import './views/result.dart';
import './views/spit_input.dart';
import './views/tip_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject Split controller for split component
    Get.put(SplitController());
    // Inject Split controller for split component
    Get.put(TipController());
    // Inject Split controller for split component
    Get.put(BillController());
    // Inject Result controller for result component
    Get.put(ResultController());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 243, 244),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
            child: Column(
              children: const [
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
