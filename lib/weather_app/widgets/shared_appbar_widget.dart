import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather_app/constants.dart';
import 'package:weather/weather_app/core/utils/extensions.dart';
import 'package:weather/weather_app/modules/home/controller.dart';

class SharedAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  SharedAppBarWidget({required this.title});

  final homeCtrl = Get.put(HomeController(city: 'boumerdes'));

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: homeCtrl.is_dark.value ? lightTextColor : darkTextColor,
              fontSize: 15.0.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'flutterfonts',
            ),
      ),
      centerTitle: true,
      backgroundColor:
          homeCtrl.is_dark.value ? lightBackgroundColor : darkBackgroundColor,
      elevation: 5,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: IconButton(
          icon: Icon(
            homeCtrl.is_dark.value ? Icons.language : Icons.language,
            color: homeCtrl.is_dark.value
                ? darkBackgroundColor
                : lightBackgroundColor,
          ),
          onPressed: () {
            homeCtrl.is_dark.value
                ? homeCtrl.is_dark.value = false
                : homeCtrl.is_dark.value = true;
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: Icon(
              homeCtrl.is_dark.value ? Icons.dark_mode : Icons.light_mode,
              color: homeCtrl.is_dark.value
                  ? darkBackgroundColor
                  : lightBackgroundColor,
            ),
            onPressed: () {
              homeCtrl.is_dark.value
                  ? homeCtrl.is_dark.value = false
                  : homeCtrl.is_dark.value = true;
            },
          ),
        ),
      ],
    );
  }
}
