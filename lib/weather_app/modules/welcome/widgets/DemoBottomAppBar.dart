import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather_app/core/utils/extensions.dart';
import 'package:weather/weather_app/modules/welcome/controller.dart';

class DemoBottomAppBar extends StatelessWidget {
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
        return BottomAppBar(
          shape: shape,
          shadowColor: Colors.grey,
          color: Colors.white,
          notchMargin: 0,
          height: 8.0.hp,
          child: IconTheme(
            data: IconThemeData(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: controller.bottomIcon(
                    path: "assets/images/home.png",
                    isTapped: controller.selectedIndex == 0,
                    onTap: () => controller.changeIndex(0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
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
