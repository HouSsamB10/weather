import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather_app/constants.dart';
import 'package:weather/weather_app/core/utils/extensions.dart';
import 'package:weather/weather_app/modules/home/controller.dart';
import 'package:weather/weather_app/modules/home/widgets/card_weather.dart';
import 'package:weather/weather_app/modules/home/widgets/five_day_forecast.dart';
import 'package:weather/weather_app/modules/home/widgets/main_widget.dart';
import 'package:weather/weather_app/widgets/shared_appbar_widget.dart';

class HomeScreen extends GetView<HomeController> {
  final homeCtrl = Get.put(HomeController(city: 'boumerdes'));
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        backgroundColor:
            controller.is_dark ? lightBackgroundColor : darkBackgroundColor,
        appBar: SharedAppBarWidget(
          title: DateFormat('EEEE, d MMMM y').format(DateTime.now()),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            bottom: 8.0.hp,
          ),
          child: Container(
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
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  MainWidget(),
                  FiveDayForecast(fiveDayData: homeCtrl.fiveDaysData),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
