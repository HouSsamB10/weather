import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather_app/constants.dart';
import 'package:weather/weather_app/core/utils/extensions.dart';
import 'package:weather/weather_app/modules/home/controller.dart';
import 'package:weather/weather_app/widgets/shared_appbar_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final homeCtrl = Get.put(HomeController(city: 'boumerdes'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          homeCtrl.is_dark.value ? lightBackgroundColor : darkBackgroundColor,
      appBar: SharedAppBarWidget(
        title: 'Screen',
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: TextField(
              onChanged: (value) => controller.city = value,
              style: const TextStyle(
                color: Colors.white,
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (value) => controller.updateWeather(),
              decoration: InputDecoration(
                suffix: IconButton(
                  icon: const Icon(
                    Icons.wrong_location_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.updateWeather();
                  },
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0.sp,
                ),
                hintText: 'Search'.toUpperCase(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
