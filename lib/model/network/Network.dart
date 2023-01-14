import 'dart:convert';
import 'dart:io';
import 'package:fakestore/model/constants.dart';
import 'package:fakestore/model/network/StatusController.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Network {

  String _content = '';

  Future<JsonResponse> post(
    String endPoint, {
    Map<String, dynamic> params = const {},
  }) async {
    Map<String, dynamic> json = {};
    JsonResponse responseJson = JsonResponse();

    try {
      _content = (params.keys
              .map((key) => '$key=${Uri.encodeQueryComponent(params[key])}'))
          .join('&');

      final Map<String, String> headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': utf8.encode(_content).length.toString()
      };

      debugPrint(params.keys.map((key) => '$key=${params[key]}').join('&'));
      debugPrint('${WebService.urlBase}$endPoint');

      await http
          .post(
        Uri.parse('${WebService.urlBase}$endPoint'),
        body: _content,
        headers: headers,
      )
          .then((response) {
        if (response.statusCode == 200) {
          debugPrint(response.body.replaceAll('\'', ''));
          json = jsonDecode(response.body.replaceAll('\'', ''));
        } else {
          debugPrint('Ha ocurrido un error:');
          debugPrint(response.statusCode.toString());
          json = {};
        }
        responseJson = JsonResponse(
          statusCode: response.statusCode,
          response: json,
          message: response.reasonPhrase.toString()
        );
      });
    } catch (_) {
      debugPrint(_.toString());
    }
    return responseJson;
  }

  Future<JsonObjectResponse> get(
      String endPoint, {
        Map<String, dynamic> params = const {},
      }) async {
    var json;
    JsonObjectResponse responseJson = JsonObjectResponse();
    if(params.isNotEmpty){
      _content = '?${(params.keys.map((key) => '$key=${Uri.encodeQueryComponent(params[key])}')).join('&')}';
    }

    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader : 'Bearer ${TokenJwk.jwk}',
      };

      debugPrint('${WebService.urlBase}$endPoint$_content');
      debugPrint('-> ${TokenJwk.jwk}');

      await http
          .get(
        Uri.parse('${WebService.urlBase}$endPoint$_content'),
        headers: headers,
      )
          .then((response) {
        if (response.statusCode == 200) {
          debugPrint(response.body.replaceAll('\'', ''));
          json = jsonDecode(response.body);
        } else {
          debugPrint('Ha ocurrido un error:');
          debugPrint(response.statusCode.toString());
          json = {};
        }
        responseJson = JsonObjectResponse(
            statusCode: response.statusCode,
            response: json,
            message: response.reasonPhrase.toString()
        );
      });
    } catch (_) {
      debugPrint(_.toString());
    }
    return responseJson;
  }
}
