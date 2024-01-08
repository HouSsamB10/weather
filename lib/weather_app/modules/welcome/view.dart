import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather_app/modules/Search/view.dart';
import 'package:weather/weather_app/modules/home/view.dart';
import 'package:weather/weather_app/modules/welcome/controller.dart';
import 'package:weather/weather_app/modules/welcome/widgets/DemoBottomAppBar.dart';

// ignore: use_key_in_widget_constructors
class WelcomeScreen extends StatelessWidget {
  final welcomeCtrl = Get.put(WelcomeController());

  final pages = [
    HomeScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      builder: (context) {
        return Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned.fill(child: pages[welcomeCtrl.selectedIndex])
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: Colors.red,
          //   onPressed: () {
          //     // welcomeCtrl.selectedIndex == 1;
          //     // welcomeCtrl.changeIndex(1);
          //   },
          //   tooltip: 'Create',
          //   // ignore: prefer_const_constructors
          //   child: Icon(
          //     Icons.add,
          //     color: Colors.white,
          //   ),
          // ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: DemoBottomAppBar(
            fabLocation: FloatingActionButtonLocation.centerDocked,
            shape: null, // const CircularNotchedRectangle(),
          ),
        );
      },
    );
  }
}
