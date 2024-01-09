import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather_app/constants.dart';
import 'package:weather/weather_app/core/utils/extensions.dart';
import 'package:weather/weather_app/models/five_days_data.dart';
import 'package:weather/weather_app/modules/home/controller.dart';

class FiveDayForecast extends StatelessWidget {
  final homeCtrl = Get.put(HomeController(city: 'boumerdes'));
  List<FiveDayData> fiveDayData;
  FiveDayForecast({Key? key, required this.fiveDayData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 50.0.hp,
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
                        color: homeCtrl.is_dark.value
                            ? darkBackgroundColor
                            : lightBackgroundColor,
                        fontSize: 15.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                fivedayList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget fivedayList() {
    return SizedBox(
      height: 40.0.hp,
      child: Column(
        children: List.generate(
          fiveDayData.length > 5 ? 5 : fiveDayData.length,
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
                SizedBox(
                  width: 80,
                  child: Text(
                    DateFormat.E()
                        .format(DateTime.now().add(Duration(days: index))),
                    style: TextStyle(
                      color: homeCtrl.is_dark.value
                          ? lightTextColor
                          : darkTextColor,
                      fontSize: 15.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                      "assets/weather/${fiveDayData[index].weather![0].icon.toString()}.png"),
                ),
                Text(
                  '${fiveDayData[index].temp!}\u2103',
                  style: TextStyle(
                    color:
                        homeCtrl.is_dark.value ? lightTextColor : darkTextColor,
                    fontSize: 15.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
