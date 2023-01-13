
import 'package:fakestore/controller/sing_in/singin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingInPage extends StatelessWidget{
  const SingInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingInController>(
      init: SingInController(),
      builder: (_){
        return Scaffold(

        );
      },
    );
  }
}