import 'package:fakestore/controller/splash/splash_controller.dart';
import 'package:fakestore/model/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) {
        return Scaffold(
          body: Center(
            child: Image.network(
              Utils().imageLogo,
              width: 200,
              height: 200,
            ),
          ),
        );
      },
    );
  }
}
