import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:weather/weather_app/constants.dart';
import 'package:weather/weather_app/core/utils/extensions.dart';
import 'package:weather/weather_app/modules/home/controller.dart';

class SharedAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  SharedAppBarWidget({required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return AppBar(
          title: Text(
            title,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: controller.is_dark ? lightTextColor : darkTextColor,
                  fontSize: 15.0.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'flutterfonts',
                ),
          ).animate().fadeIn(
                duration: const Duration(milliseconds: 1000),
              ),
          centerTitle: true,
          backgroundColor:
              controller.is_dark ? lightBckgColor1 : darkBckgdColor1,
          elevation: 5,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: Icon(
                controller.is_dark ? Icons.language : Icons.language,
                color: controller.is_dark
                    ? darkBackgroundColor
                    : lightBackgroundColor,
              ),
              onPressed: () {
                controller.is_dark
                    ? controller.is_dark = false
                    : controller.is_dark = true;
              },
            ),
          ).animate().fadeIn(
                duration: const Duration(milliseconds: 1000),
              ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: Icon(
                  controller.is_dark ? Icons.dark_mode : Icons.light_mode,
                  color: controller.is_dark
                      ? darkBackgroundColor
                      : lightBackgroundColor,
                ),
                onPressed: () {
                  controller.changedark_light();
                },
              ),
            ).animate().fadeIn(
                  duration: const Duration(milliseconds: 1000),
                ),
          ],
        );
      },
    );
  }
}
