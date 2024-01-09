import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/weather_app/constants.dart';
import 'package:weather/weather_app/core/utils/extensions.dart';
import 'package:weather/weather_app/modules/home/controller.dart';
import 'package:weather/weather_app/widgets/shared_appbar_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor:
              controller.is_dark ? lightBackgroundColor : darkBackgroundColor,
          appBar: SharedAppBarWidget(
            title: 'Search',
          ),
          body: Container(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            width: 100.0.wp,
            height: 100.0.hp,
            decoration: BoxDecoration(
              gradient: controller.is_dark
                  ? const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        lightBckgColor2,
                        lightBckgColor1,
                      ],
                    )
                  : const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        darkBckgdColor2,
                        darkBckgdColor1,
                      ],
                    ),
            ),
            child: TextField(
              onChanged: (value) => controller.city = value,
              style: TextStyle(
                color: controller.is_dark
                    ? darkBackgroundColor
                    : lightBackgroundColor,
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (value) => controller.updateWeather(),
              decoration: InputDecoration(
                suffix: IconButton(
                  icon: Icon(Icons.wrong_location_rounded,
                      color: controller.is_dark
                          ? darkBackgroundColor
                          : lightBackgroundColor),
                  onPressed: () {
                    controller.updateWeather();
                  },
                ),
                hintStyle: TextStyle(
                  color: controller.is_dark
                      ? darkBackgroundColor
                      : lightBackgroundColor,
                  fontSize: 14.0.sp,
                ),
                hintText: 'Search'.toUpperCase(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: controller.is_dark
                        ? darkBackgroundColor
                        : lightBackgroundColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: controller.is_dark
                        ? darkBackgroundColor
                        : lightBackgroundColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: controller.is_dark
                        ? darkBackgroundColor
                        : lightBackgroundColor,
                  ),
                ),
              ),
            ),
          ).animate().fadeIn(
                duration: const Duration(milliseconds: 1000),
              ),
        );
      },
    );
  }
}
