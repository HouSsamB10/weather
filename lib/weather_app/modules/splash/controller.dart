import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 6), () {
      Get.offAllNamed(
        '/onboarding',
      );
    });
    super.onInit();
  }
}
