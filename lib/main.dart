import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather_app/core/utils/helpers.dart';
import 'package:weather/weather_app/modules/Search/view.dart';
import 'package:weather/weather_app/modules/home/binding.dart';
import 'package:weather/weather_app/modules/home/view.dart';
import 'package:weather/weather_app/modules/splash/binding.dart';
import 'package:weather/weather_app/modules/splash/view.dart';
import 'package:weather/weather_app/modules/welcome/binding.dart';
import 'package:weather/weather_app/modules/welcome/view.dart';

void main() async {
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      // translation step
      // translations: Message(),
      // locale: Locale('ar'),
      // end translation step
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/welcome',
          page: () => WelcomeScreen(),
          binding: WelcomeBinding(),
        ),
        GetPage(
          name: '/search',
          page: () => SearchScreen(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
