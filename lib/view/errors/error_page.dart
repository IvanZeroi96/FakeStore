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
            child: Column(
              children: [

              ],
            ),
          ),
        );
      },
    );
  }
}
