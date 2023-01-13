import 'package:fakestore/view/home/home_page.dart';
import 'package:fakestore/view/splash/splash_page.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(
    name: '/',
    page: () => const SplashPage(),
  ),
  GetPage(
    name: '/home',
    page: () => const HomePage(),
    transition: Transition.rightToLeftWithFade,
  ),
];
