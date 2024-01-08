import 'package:get/get.dart';
import 'package:weather/weather_app/modules/welcome/controller.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
  }
}
