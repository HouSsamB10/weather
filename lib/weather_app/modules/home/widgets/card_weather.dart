import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/weather_app/constants.dart';
import 'package:weather/weather_app/core/utils/extensions.dart';
import 'package:weather/weather_app/modules/home/controller.dart';

class WeatherCard extends StatelessWidget {
  final String cityName;
  final String temperature;
  final String image;
  WeatherCard({
    required this.cityName,
    required this.temperature,
    required this.image,
  });

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
            : Container(
                decoration: BoxDecoration(
                  color: controller.is_dark
                      ? lightBckgColor2
                      : Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.all(14.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cityName,
                          style: TextStyle(
                            color: controller.is_dark
                                ? lightTextColor
                                : darkTextColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '$temperature',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: controller.is_dark
                                ? lightTextColor
                                : darkTextColor,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Lottie.asset(
                          image,
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
