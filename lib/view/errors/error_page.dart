import 'package:fakestore/controller/errors/error_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<ErrorController>(
      init: ErrorController(),
      builder: (_) {
        return Scaffold(
          body: Center(
            child: SizedBox(
              width: 340,
              height: 340,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Unthorized.png',
                    height: 200,
                    width: 200,
                  ),
                  Text(_.mensaje,style: const TextStyle().copyWith(fontSize: 20),),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
