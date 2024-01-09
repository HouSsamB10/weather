import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather_app/models/five_days_data.dart';

class DailyDataForecast extends StatelessWidget {
  List<FiveDayData> fiveDayData;
  DailyDataForecast({Key? key, required this.fiveDayData}) : super(key: key);

  // string manipulation
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Next Days",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: fiveDayData.length > 7 ? 7 : fiveDayData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          DateTime.fromMillisecondsSinceEpoch(
                                  int.parse(
                                      fiveDayData[index].dateTime.toString()),
                                  isUtc: true)
                              .toUtc()
                              .toString(),
                          // getDay(
                          //   int.parse(fiveDayData[index].dateTime),
                          // ),
                          // getDay(DateTime.parse(
                          //         fiveDayData[index].dateTime.toString())
                          //     .day),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 30,
                      //   width: 30,
                      //   child: Image.asset(
                      //       "assets/weather/${fiveDayData[index].}.png"),
                      // ),
                      Text(fiveDayData[index].temp.toString())
                    ],
                  )),
              Container(
                height: 1,
                color: Colors.black,
              )
            ],
          );
        },
      ),
    );
  }
}
