import 'package:fakestore/view/detail_product/detail_product_page.dart';
import 'package:fakestore/view/errors/error_page.dart';
import 'package:fakestore/view/home/home_page.dart';
import 'package:fakestore/view/login/login_page.dart';
import 'package:fakestore/view/presentation/presentation_page.dart';
import 'package:fakestore/view/sing_in/singin_page.dart';
import 'package:fakestore/view/splash/splash_page.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(
    name: '/',
    page: () => const SplashPage(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: '/singin',
    page: () => const SingInPage(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: '/login',
    page: () => const LoginPage(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: '/home',
    page: () => const HomePage(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: '/detail_product',
    page: () => const DetailProductPage(),
    transition: Transition.circularReveal,
    transitionDuration: const Duration(
      milliseconds: 50,
    ),
  ),
  GetPage(
    name: '/error',
    page: () => const ErrorPage(),
    transition: Transition.cupertinoDialog,
    fullscreenDialog: true,
  ),
  GetPage(
    name: '/presentation',
    page: () => const PresentationPage(),
    transition: Transition.circularReveal,
    fullscreenDialog: true,
  ),
];
