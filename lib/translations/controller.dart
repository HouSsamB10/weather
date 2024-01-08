import 'dart:ui';

import 'package:get/get.dart';

class MessageController extends GetxController {
  final languageValue = 'en'.obs;

  void changeLanguageValue(String value) {
    languageValue.value = value;
    // coming soon local storage
    Get.updateLocale(Locale(value, ''));
  }
}
