import 'package:get/get.dart';

class ResultController extends GetxController {
  var totalPerPerson = 12.0.obs;
  var totalBill = 6.0.obs;
  var totalTip = 6.0.obs;

  String get totalBillText => totalBill.string;

  String get totalTipText => totalTip.string;
}
