import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather_app/modules/home/controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return Container(
              padding: EdgeInsets.only(top: 100, left: 20, right: 20),
              child: TextField(
                onChanged: (value) => controller.city = value,
                style: const TextStyle(
                  color: Colors.white,
                ),
                textInputAction: TextInputAction.search,
                onSubmitted: (value) => controller.updateWeather(),
                decoration: InputDecoration(
                  suffix: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintStyle: const TextStyle(color: Colors.white),
                  hintText: 'Search'.toUpperCase(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
