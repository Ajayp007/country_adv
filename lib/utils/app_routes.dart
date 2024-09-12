import 'package:country_adv/screen/detail/view/detail_screen.dart';
import 'package:country_adv/screen/home/view/home_screen.dart';
import 'package:country_adv/screen/like/view/like_screen.dart';
import 'package:country_adv/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> app_routes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
  'detail': (context) => const DetailScreen(),
  'like': (context) => const LikedScreen(),
};
