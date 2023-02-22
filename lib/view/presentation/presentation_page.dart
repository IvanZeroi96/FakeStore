import 'package:fakestore/controller/presentation/presentation_controller.dart';
import 'package:fakestore/model/l10n/l10n.dart';
import 'package:fakestore/model/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<PresentationController>(
      init: PresentationController(),
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                SvgPicture.asset(
                  '${RouteImages().imageRoute}image_1.svg',
                ),
                Positioned(
                  bottom: 1,
                  right: 20,
                  child: OutlinedButton(
                    onPressed: () => _.goToLogin(),
                    child: Text(
                      S.of(context)!.login,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: 20,
                  child: OutlinedButton(
                    onPressed: () => _.goToHome(),
                    child: Text(
                      S.of(context)!.guest,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: Text(
                    S.of(context)!.appName,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
