import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather_app/modules/Search/view.dart';
import 'package:weather/weather_app/modules/home/view.dart';
import 'package:weather/weather_app/modules/welcome/controller.dart';
import 'package:weather/weather_app/modules/welcome/widgets/DemoBottomAppBar.dart';

// ignore: use_key_in_widget_constructors
class WelcomeScreen extends StatelessWidget {
  // final welcomeCtrl = Get.put(WelcomeController());

  final pages = [
    HomeScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned.fill(child: pages[controller.selectedIndex]),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: DemoBottomAppBar(
            fabLocation: FloatingActionButtonLocation.centerDocked,
            shape: null,
          ),
        );
      },
    );
  }
}
