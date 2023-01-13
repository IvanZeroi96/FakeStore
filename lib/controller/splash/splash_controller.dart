import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onReady() {
    _validateLogin();
    super.onReady();
  }

  void _validateLogin(){
    Future.delayed(const Duration(seconds: 5),(){
      Get.offAndToNamed('/home') ;
    });
  }
}