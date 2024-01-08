import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather_app/modules/home/binding.dart';
import 'package:weather/weather_app/modules/home/view.dart';

void main() async {
  runApp(const MyApp());
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
          page: () => HomeScreen(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
