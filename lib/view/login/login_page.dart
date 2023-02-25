import 'package:fakestore/controller/login/login_controller.dart';
import 'package:fakestore/model/colors.dart';
import 'package:fakestore/model/l10n/l10n.dart';
import 'package:fakestore/model/utils.dart';
import 'package:fakestore/view/ui/fs_textformfield.dart';
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
                            FSTextFormField(
                              controller: _.controllerName,
                              keyboardType: TextInputType.text,
                              validator: _.validateUserName,
                              onChanged: _.onChangeUserName,
                              label: S.of(context)!.userName,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GetBuilder<LoginController>(
                              id: 'Password',
                              builder: (_) {
                                return FSTextFormField(
                                  controller: _.controllerPass,
                                  keyboardType: TextInputType.text,
                                  validator: _.validatePass,
                                  onChanged: _.onChangePass,
                                  obscureText: !_.isVisibilityPass,
                                  label: S.of(context)!.password,
                                  suffixIcon: IconButton(
                                    icon: !_.isVisibilityPass
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility),
                                    onPressed: _.changePasswordVisibility,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            GetBuilder<LoginController>(
                                id: 'BtnLogin',
                                builder: (_) {
                                  return OutlinedButton(
                                    onPressed: _.isCompleteForm
                                        ? () => _.onLogin()
                                        : null,
                                    child: Text(
                                      S.of(context)!.login,
                                      style: const TextStyle().copyWith(
                                        color: FSColors.purple,
                                      ),
                                    ),
                                  );
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () => _.goToSingIn(),
                              child: Text(
                                S.of(context)!.register,
                                style: Theme.of(context).textTheme.bodyText1,
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
        );
      },
    );
  }
}
