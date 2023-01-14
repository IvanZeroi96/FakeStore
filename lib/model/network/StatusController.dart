
import 'package:fakestore/model/network/Network.dart';
import 'package:fakestore/model/products/products.dart';
import 'package:get/get.dart';

abstract class FSGetXController extends GetxController {

  Future<JsonResponse> post(endPoint,{Map<String,dynamic> params = const {}}) async{
    final network = Network();
    final JsonResponse response = await network.post(endPoint,params: params);
    return response;
  }

  Future<JsonResponseObject> getProductos(endPoint,{Map<String,dynamic> params = const {}}) async{
    JsonResponseObject response = JsonResponseObject();
    final network = Network();
    final JsonObjectResponse responseJson = await network.get(endPoint,params: params);
    if(responseJson.statusCode == 200){
      List<Product> listProducts = [];
      for (var element in responseJson.response) {
        listProducts.add(Product.fromJson(element));
      }
      response.statusCode = responseJson.statusCode;
      response.message = responseJson.message;
      response.response = listProducts;
    }
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

class JsonObjectResponse {
  String message;
  int statusCode;
  List<dynamic> response;

  JsonObjectResponse({
    this.message = '',
    this.statusCode = 0,
    this.response = const [],
  });
}

class JsonResponseObject {
  String message;
  int statusCode;
  List<Product> response;

  JsonResponseObject({
    this.message = '',
    this.statusCode = 0,
    this.response = const [],
  });
}