import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather_app/constants.dart';
import 'package:weather/weather_app/core/utils/extensions.dart';
import 'package:weather/weather_app/models/five_days_data.dart';
import 'package:weather/weather_app/modules/home/controller.dart';

class FiveDayForecast extends StatelessWidget {
  List<FiveDayData> fiveDayData;
  FiveDayForecast({Key? key, required this.fiveDayData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return controller.is_loading
            ? const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 70.0.hp,
                  width: 100.0.hp,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    // width: double.infinity,
                    // height: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 15,
                          ),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Next 5 Days",
                              style: TextStyle(
                                color: controller.is_dark
                                    ? darkBackgroundColor
                                    : lightBackgroundColor,
                                fontSize: 13.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ).animate().fadeIn(
                                  duration: const Duration(milliseconds: 1000),
                                ),
                          ),
                        ),
                        fivedayList(),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget fivedayList() {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Expanded(
          child: Column(
            children: List.generate(
              fiveDayData.length > 7 ? 7 : fiveDayData.length,
              (index) => Container(
                height: 8.0.hp,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 80,
                          child: Text(
                            DateFormat.E().format(
                                DateTime.now().add(Duration(days: index + 1))),
                            style: TextStyle(
                              color: controller.is_dark
                                  ? lightTextColor
                                  : darkTextColor,
                              fontSize: 9.0.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.asset(
                                  "assets/weather/${fiveDayData[index].weather![0].icon.toString()}.png"),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '${fiveDayData[index].weather![0].description.toString()}',
                              style: TextStyle(
                                color: controller.is_dark
                                    ? lightTextColor
                                    : darkTextColor,
                                fontSize: 6.0.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '${fiveDayData[index].temp!}\u2103',
                      style: TextStyle(
                        color:
                            controller.is_dark ? lightTextColor : darkTextColor,
                        fontSize: 11.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(
                    duration: const Duration(milliseconds: 1000),
                  ),
            ),
          ),
        );
      },
    );
  }
}
