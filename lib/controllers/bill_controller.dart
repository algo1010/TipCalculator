import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillController extends GetxController {
  final TextEditingController textController = TextEditingController();
  var billValue = 0.0.obs;
  var isShowErrorMessage = false.obs;

  @override
  void onInit() {
    textController.addListener(() {
      final value = double.tryParse(textController.text);
      if (value != null) {
        billValue.value = value;
        isShowErrorMessage.value = false;
      } else {
        if (textController.text.isNotEmpty) {
          isShowErrorMessage.value = true;
        }
      }
      update();
    });
    super.onInit();
  }

  @override
  void onClose() {
    textController.removeListener(() {});
    super.onClose();
  }
}
