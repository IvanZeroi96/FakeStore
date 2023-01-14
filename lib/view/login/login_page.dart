import 'package:fakestore/controller/login/login_controller.dart';
import 'package:fakestore/model/l10n/l10n.dart';
import 'package:fakestore/model/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Image.network(
                          Utils().imageLogo,
                          width: 90,
                          height: 90,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          color: Colors.grey.shade200,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: _decorationText(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          color: Colors.grey.shade200,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: _decorationPass(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(Localizationes.of(context)!.login),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            Localizationes.of(context)!.singIn,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  InputDecoration _decorationText(){
    return const InputDecoration(
      labelText: 'Correo electronico',
      contentPadding: EdgeInsets.symmetric(
          vertical: 8, horizontal: 8,),
      isDense: false,
      border: InputBorder.none,
      disabledBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      counterText: '',
    );
  }

  InputDecoration _decorationPass(){
    return const InputDecoration(
      contentPadding: EdgeInsets.symmetric(
          vertical: 8, horizontal: 8,),
      labelText: 'Contraseña',
      isDense: false,
      border: InputBorder.none,
      disabledBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      counterText: '',
    );
  }
}
