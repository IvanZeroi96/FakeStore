import 'package:fakestore/model/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    _validateLogin();
    super.onReady();
  }

  void _validateLogin() {
    Future.delayed(const Duration(seconds: 5), () {
      _isLogged().then((logged) async {
        if (logged) {
          Get.offAllNamed('/home');
        } else {
          Get.offAllNamed('/login');
        }
      });
    });
  }

  Future<bool> _isLogged() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(Persistence.isLogged) ?? false;
  }
}
