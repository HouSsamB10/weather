import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather_app/constants.dart';
import 'package:weather/weather_app/core/utils/extensions.dart';
import 'package:weather/weather_app/modules/home/controller.dart';

class MainWidget extends StatelessWidget {
  MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return controller.is_loading
            ? Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 40.0.hp,
                  width: 100.0.hp,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 30.0.hp,
                  width: 100.0.hp,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: double.infinity,
                    child: Card(
                      color: controller.is_dark
                          ? lightBckgColor2
                          : darkBckgdColor2,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: const EdgeInsets.only(right: 20),
                              child: SizedBox(
                                width: 150,
                                height: 150,
                                child: Image.asset(
                                    "assets/weather/${controller.currentWeatherData.weather![0].icon.toString()}.png"),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${controller.currentWeatherData.name}'
                                        .toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          color: controller.is_dark
                                              ? lightTextColor
                                              : darkTextColor,
                                          fontSize: 20.0.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'flutterfonts',
                                        ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(left: 50),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            '${controller.currentWeatherData.weather![0].description}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: controller.is_dark
                                                      ? lightTextColor
                                                      : darkTextColor,
                                                  fontSize: 22,
                                                  fontFamily: 'flutterfonts',
                                                ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(
                                                  color: controller.is_dark
                                                      ? lightTextColor
                                                      : darkTextColor,
                                                  fontFamily: 'flutterfonts',
                                                ),
                                          ),
                                          Text(
                                            'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: controller.is_dark
                                                      ? lightTextColor
                                                      : darkTextColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'flutterfonts',
                                                ),
                                          ),
                                        ],
                                      ),
                                    ).animate().fadeIn(
                                          duration: const Duration(
                                              milliseconds: 1000),
                                        ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
