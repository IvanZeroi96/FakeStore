import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SingInController extends GetxController {

  bool _isCompleteForm = false;
  bool _isVisibilityPass = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();

  bool get isCompleteForm => _isCompleteForm;
  bool get isVisibilityPass => _isVisibilityPass;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get controllerName => _controllerName;
  TextEditingController get controllerEmail => _controllerEmail;
  TextEditingController get controllerPass => _controllerPass;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

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

  String? validateEmail(String? value) {
    if (value!.trim().isEmpty) {
      return "Ingresa tu email.";
    } else if (!GetUtils.isEmail(value)) {
      return "Ingresa un email válido.";
    }
    return null;
  }

  String? validatePass(String? value) {
    if (value!.trim().isEmpty) {
      return "Ingresa tu contraseña.";
    }
    if (value.trim().length < 8) {
      return "Tu contraseña debe tener al menos 8 digitos.";
    }
    return null;
  }

  void onChangeUserName(String? value) {
    _validateBtnContinuar();
  }
  void onChangeEmail(String? value) {
    _validateBtnContinuar();
  }

  void onChangePass(String? value) {
    _validateBtnContinuar();
  }

  void _validateBtnContinuar(){
    if(_formKey.currentState!.validate()){
      _isCompleteForm = true;
    }else{
      _isCompleteForm = false;
    }
    update(['BtnRegister']);
  }
}
