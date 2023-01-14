
import 'package:fakestore/model/network/StatusController.dart';
import 'package:get/get.dart';

class ErrorController extends FSGetXController{
  int _statusCode = 0;
  String _mensaje = '';

  String get mensaje => _mensaje;


  @override
  void onInit() {
    if(Get.parameters['StatusCode'] != null){
      _statusCode = int.tryParse(Get.parameters['StatusCode']!)!;
    }
    _evaluateCode();

    super.onInit();
  }

  void _evaluateCode(){
    switch(_statusCode){
      case 401:
        _mensaje = 'Tu contrasña o usuario son incorrectos';
        break;
    }
  }

}