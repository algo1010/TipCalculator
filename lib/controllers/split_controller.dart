import 'package:get/get.dart';

class SplitController extends GetxController {
  var count = 1.obs;
  var incrementButtonEnable = true.obs;
  var decrementButtonEnable = false.obs;

  void increment() {
    count++;
    if (count.value >= 10) {
      incrementButtonEnable.value = false;
    }
    if (!decrementButtonEnable.value) {
      decrementButtonEnable.value = true;
    }
    update();
  }

  void decrement() {
    count--;
    if (count.value <= 1) {
      decrementButtonEnable.value = false;
    }
    if (!incrementButtonEnable.value) {
      incrementButtonEnable.value = true;
    }
    update();
  }
}
