import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/weather_app/modules/splash/controller.dart';

class SplashScreen extends StatelessWidget {
  final splashCtrl = Get.put(SplashController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Weather of the World",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 248, 200, 216),
              ),
            ),
            const SizedBox(height: 20),
            Lottie.asset(
              'assets/lotties/cloudy_main.json',
              height: 370,
              width: double.infinity,
              frameRate: FrameRate(70),
              animate: true,
              repeat: true,
            ),
          ],
        )),
      ),
    );
  }
}
