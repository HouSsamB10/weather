import 'package:get/get.dart';
import 'package:weather/weather_app/modules/splash/controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
