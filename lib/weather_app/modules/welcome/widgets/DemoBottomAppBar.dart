import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather_app/constants.dart';
import 'package:weather/weather_app/core/utils/extensions.dart';
import 'package:weather/weather_app/modules/home/controller.dart';
import 'package:weather/weather_app/modules/welcome/controller.dart';

class DemoBottomAppBar extends StatelessWidget {
  final homeCtrl = Get.put(HomeController(city: 'boumerdes'));

  DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      builder: (controller) {
        return Obx(
          () => BottomAppBar(
            shape: shape,
            shadowColor: Colors.grey,
            color: homeCtrl.is_dark.value
                ? lightBackgroundColor
                : darkBackgroundColor,
            notchMargin: 0,
            height: 8.0.hp,
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: controller.bottomIcon(
                    path: "assets/images/home.png",
                    isTapped: controller.selectedIndex == 0,
                    onTap: () => controller.changeIndex(0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: controller.bottomIcon(
                    path: "assets/images/search.png",
                    isTapped: controller.selectedIndex == 1,
                    onTap: () => controller.changeIndex(1),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
