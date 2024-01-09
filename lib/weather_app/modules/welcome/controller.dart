import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }

  Widget bottomIcon({
    required String path,
    bool isTapped = false,
    VoidCallback? onTap,
  }) {
    return IconButton(
      onPressed: onTap,
      icon: AnimatedContainer(
        height: isTapped ? 35 : 25,
        duration: const Duration(milliseconds: 300),
        child: Image.asset(
          path,
          color: isTapped ? Colors.blue : Colors.white,
        ),
      ),
    );
  }
}
