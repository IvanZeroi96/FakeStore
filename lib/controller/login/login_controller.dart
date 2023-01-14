import 'package:fakestore/model/constants.dart';
import 'package:fakestore/model/network/StatusController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends FSGetXController {
  bool _isCompleteForm = false;
  bool _isVisibilityPass = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();

  bool get isCompleteForm => _isCompleteForm;
  bool get isVisibilityPass => _isVisibilityPass;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get controllerName => _controllerName;
  TextEditingController get controllerPass => _controllerPass;

  void changePasswordVisibility() {
    _isVisibilityPass = !_isVisibilityPass;
    update(['Password']);
  }

  String? validateUserName(String? value) {
    if (value!.trim().isEmpty) {
      return "Ingresa tu usuario.";
    } else if (!GetUtils.isUsername(value)) {
      return "Ingresa un usuario válido.";
    }
    return null;
  }

  String? validatePass(String? value) {
    if (value!.trim().isEmpty) {
      return "Ingresa tu contraseña.";
    }
    if (value.trim().length < 3) {
      return "Tu contraseña debe tener al menos 3 digitos.";
    }
    return null;
  }

  void onChangeUserName(String? value) {
    _validateBtnContinuar();
  }

  void onChangePass(String? value) {
    _validateBtnContinuar();
  }

  void _validateBtnContinuar() {
    if (_formKey.currentState!.validate()) {
      _isCompleteForm = true;
    } else {
      _isCompleteForm = false;
    }
    update(['BtnLogin']);
  }

  void onLogin() async {

    JsonResponse response = await post(
      EndPoint.login,
      params: {
        'username': _controllerName.text.trim(),
        'password': _controllerPass.text.trim(),
      },
    );
    if(response.statusCode == 200){
      Get.offAllNamed('/home');
    }else{
      Get.toNamed('/error',parameters: {'StatusCode' : response.statusCode.toString()});
    }
  }

  void goToSingIn() {
    Get.toNamed('/singin');
  }
}
