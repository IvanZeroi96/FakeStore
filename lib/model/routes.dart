import 'package:fakestore/view/errors/error_page.dart';
import 'package:fakestore/view/home/home_page.dart';
import 'package:fakestore/view/login/login_page.dart';
import 'package:fakestore/view/sing_in/singin_page.dart';
import 'package:fakestore/view/splash/splash_page.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(
    name: '/',
    page: () => const SplashPage(),
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
    name: '/error',
    page: () => const ErrorPage(),
    transition: Transition.cupertinoDialog,
  ),
];
