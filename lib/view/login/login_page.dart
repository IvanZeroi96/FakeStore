import 'package:fakestore/controller/login/login_controller.dart';
import 'package:fakestore/model/colors.dart';
import 'package:fakestore/model/l10n/l10n.dart';
import 'package:fakestore/model/utils.dart';
import 'package:fakestore/view/ui/progress_hud.dart';
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
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: ProgressHUD(
              loading: _.isLoading,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _.formKey,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Image.asset(
                                Utils().imageLogoAsset,
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
                                  controller: _.controllerName,
                                  keyboardType: TextInputType.text,
                                  validator: _.validateUserName,
                                  onChanged: _.onChangeUserName,
                                  cursorColor: Colors.black,
                                  decoration: _decorationName(),
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
                                child: GetBuilder<LoginController>(
                                    id: 'Password',
                                    builder: (context) {
                                      return TextFormField(
                                        controller: _.controllerPass,
                                        keyboardType: TextInputType.text,
                                        validator: _.validatePass,
                                        onChanged: _.onChangePass,
                                        obscureText: !_.isVisibilityPass,
                                        cursorColor: Colors.black,
                                        decoration: _decorationPass(_),
                                      );
                                    }),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GetBuilder<LoginController>(
                                  id: 'BtnLogin',
                                  builder: (_) {
                                    return OutlinedButton(
                                      onPressed: _.isCompleteForm
                                          ? () => _.onLogin()
                                          : null,
                                      child: Text(
                                        Localizationes.of(context)!.login,
                                        style: const TextStyle().copyWith(
                                          color: FSColors.purple,
                                        ),
                                      ),
                                    );
                                  }),
                              const SizedBox(
                                height: 12,
                              ),
                              InkWell(
                                onTap: () => _.goToSingIn(),
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
              ),
            ),
          ),
        );
      },
    );
  }

  InputDecoration _decorationName() {
    return const InputDecoration(
      labelText: 'Nombre usuario',
      contentPadding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      isDense: false,
      counterText: '',
    );
  }

  InputDecoration _decorationPass(LoginController _) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      labelText: 'Contraseña',
      isDense: false,
      suffixIcon: IconButton(
        icon: !_.isVisibilityPass
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
        onPressed: _.changePasswordVisibility,
      ),
      counterText: '',
    );
  }
}
