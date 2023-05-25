import '../controllers/tip_controller.dart';
import './bill_controller.dart';
import './split_controller.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  var totalPerPerson = '0'.obs;
  var totalBill = '0'.obs;
  var totalTip = '0'.obs;

  String get totalBillText => totalBill.value;
  String get totalTipText => totalTip.value;

  @override
  void onReady() {
    super.onReady();

    final splitStream = Get.find<SplitController>().count.stream;
    final billStream = Get.find<BillController>().billValue.stream;
    final tipStream = Get.find<TipController>().tipValue.stream;

    splitStream.listen((event) {
      calculate();
    });

    billStream.listen((event) {
      calculate();
    });

    tipStream.listen((event) {
      calculate();
    });
  }

  void calculate() {
    final split = Get.find<SplitController>().count.value;
    final bill = Get.find<BillController>().billValue.value;
    final tip = Get.find<TipController>().tipValue.value;
    final tipAmount = tip * bill;
    final totalAmount = tipAmount + bill;

    final totalTipRaw = tipAmount.toPrecision(1);
    final totalPerPersonRaw = (totalAmount / split).toPrecision(1);
    final totalBillRaw = totalAmount.toPrecision(1);

    totalTip.value = totalTipRaw
        .toStringAsFixed(totalTipRaw.truncateToDouble() == totalTipRaw ? 0 : 1);
    totalPerPerson.value = totalPerPersonRaw.toStringAsFixed(
        totalPerPersonRaw.truncateToDouble() == totalPerPersonRaw ? 0 : 1);
    totalBill.value = totalBillRaw.toStringAsFixed(
        totalBillRaw.truncateToDouble() == totalBillRaw ? 0 : 1);

    update();
  }
}
