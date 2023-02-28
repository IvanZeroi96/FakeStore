import 'package:fakestore/model/network/StatusController.dart';
import 'package:fakestore/model/products/products.dart';
import 'package:get/get.dart';

class DetailProductController extends FSGetXController {
  String id = '';
  late Product _product;

  Product get product => _product;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments['id'] != null) {
      id = Get.arguments['id']!;
    }

    if (Get.arguments['product'] != null) {
      _product = Get.arguments['product'];
    }
  }

  void goBackHome() {
    Get.back();
  }
}
