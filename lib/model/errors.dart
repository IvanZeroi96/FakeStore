
import 'package:get/get.dart';

class Errors{

  void errors(int code,{String message = ''}){
    switch(code){
      case 401:
        Get.snackbar('¡Upss!', message.isEmpty ? 'No estas autorizado' : message);
        break;
      case 404:
        Get.snackbar('¡Upss!', message.isEmpty ? 'No encontrado' : message);
        break;
      case 0:
        Get.snackbar('¡Upss!', message.isEmpty ? 'Algo salio mal.' : message);
        break;
    }
  }
}