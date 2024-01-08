import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather_app/core/utils/extensions.dart';
import 'package:weather/weather_app/modules/home/binding.dart';
import 'package:weather/weather_app/modules/home/view.dart';
import 'package:weather/weather_app/modules/welcome/view.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  RxInt currentIndex = 0.obs;

  List<Widget> buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 1.5.hp,
      width: isActive ? 10.0.wp : 5.0.wp,
      margin: EdgeInsets.only(right: 1.5.wp),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }

  void onboardingRoutes() {
    if (currentIndex < 2) {
      currentIndex++;
      if (currentIndex < 3) {
        pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    } else {
      Get.offNamed(
        '/welcome',
      );
    }
  }
}
