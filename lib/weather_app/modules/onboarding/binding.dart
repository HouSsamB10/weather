import 'package:get/get.dart';
import 'package:weather/weather_app/modules/onboarding/controller.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
  }
}
