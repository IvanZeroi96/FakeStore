import 'package:fakestore/controller/sing_in/singin_controller.dart';
import 'package:fakestore/model/colors.dart';
import 'package:fakestore/model/l10n/l10n.dart';
import 'package:fakestore/model/utils.dart';
import 'package:fakestore/view/ui/fs_textformfield.dart';
import 'package:fakestore/view/ui/progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingInPage extends StatelessWidget {
  const SingInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingInController>(
      init: SingInController(),
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
                            FSTextFormField(
                              controller: _.controllerEmail,
                              keyboardType: TextInputType.emailAddress,
                              validator: _.validateEmail,
                              onChanged: _.onChangeEmail,
                              label: S.of(context)!.email,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GetBuilder<SingInController>(
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
                            GetBuilder<SingInController>(
                                id: 'BtnSingIn',
                                builder: (_) {
                                  return OutlinedButton(
                                    onPressed: _.isCompleteForm
                                        ? () => _.onSingIn()
                                        : null,
                                    child: Text(
                                      S.of(context)!.singIn,
                                      style: const TextStyle().copyWith(
                                        color: FSColors.purple,
                                      ),
                                    ),
                                  );
                                }),
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
