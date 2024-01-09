import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather_app/constants.dart';
import 'package:weather/weather_app/core/utils/extensions.dart';
import 'package:weather/weather_app/modules/home/controller.dart';
import 'package:weather/weather_app/modules/home/widgets/five_day_forecast.dart';
import 'package:weather/weather_app/widgets/shared_appbar_widget.dart';

class HomeScreen extends GetView<HomeController> {
  final homeCtrl = Get.put(HomeController(city: 'boumerdes'));
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor:
            homeCtrl.is_dark.value ? lightBackgroundColor : darkBackgroundColor,
        appBar: SharedAppBarWidget(
          title: 'Home Page',
        ),
        body: GetBuilder<HomeController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                homeCtrl.is_loading
                    ? const CircularProgressIndicator()
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
                              color: homeCtrl.is_dark.value
                                  ? lightBackgroundColor
                                  : darkBackgroundColor,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.only(
                                      top: 15,
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                            '${homeCtrl.currentWeatherData.name}'
                                                .toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: homeCtrl.is_dark.value
                                                      ? lightTextColor
                                                      : darkTextColor,
                                                  fontSize: 30.0.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'flutterfonts',
                                                ),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            DateFormat()
                                                .add_MMMMEEEEd()
                                                .format(DateTime.now()),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: homeCtrl.is_dark.value
                                                      ? lightTextColor
                                                      : darkTextColor,
                                                  fontSize: 16.0.sp,
                                                  fontFamily: 'flutterfonts',
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(left: 50),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              '${homeCtrl.currentWeatherData.weather![0].description}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    color:
                                                        homeCtrl.is_dark.value
                                                            ? lightTextColor
                                                            : darkTextColor,
                                                    fontSize: 22,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              '${(homeCtrl.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2!
                                                  .copyWith(
                                                    color:
                                                        homeCtrl.is_dark.value
                                                            ? lightTextColor
                                                            : darkTextColor,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                            ),
                                            Text(
                                              'min: ${(homeCtrl.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(homeCtrl.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    color:
                                                        homeCtrl.is_dark.value
                                                            ? lightTextColor
                                                            : darkTextColor,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 120,
                                              height: 120,
                                              child: Image.asset(
                                                  "assets/weather/${homeCtrl.currentWeatherData.weather![0].icon.toString()}.png"),
                                            ),
                                            // Container(
                                            //   child: Text(
                                            //     'wind ${homeCtrl.currentWeatherData.wind!.speed} m/s',
                                            //     style: Theme.of(context)
                                            //         .textTheme
                                            //         .caption!
                                            //         .copyWith(
                                            //           color:
                                            //               homeCtrl.is_dark.value
                                            //                   ? lightTextColor
                                            //                   : darkTextColor,
                                            //           fontSize: 14,
                                            //           fontWeight:
                                            //               FontWeight.bold,
                                            //           fontFamily:
                                            //               'flutterfonts',
                                            //         ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                FiveDayForecast(fiveDayData: homeCtrl.fiveDaysData),
              ],
            ),
          );
        }),
      ),
    );
  }
}
