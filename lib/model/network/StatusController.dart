
import 'package:fakestore/model/network/Network.dart';
import 'package:get/get.dart';

abstract class FSGetXController extends GetxController {

  Future<JsonResponse> post(endPoint,{Map<String,dynamic> params = const {}}) async{
    final network = Network();
    final JsonResponse response = await network.post(endPoint,params: params);
    return response;
  }
}


class JsonResponse {
  String message;
  int statusCode;
  Map<String,dynamic> response;

  JsonResponse({
    this.message = '',
    this.statusCode = 0,
    this.response = const {},
  });
}