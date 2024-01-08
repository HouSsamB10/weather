import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather_app/core/utils/extensions.dart';
import 'package:weather/weather_app/modules/onboarding/controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  OnboardingController onboardingCtrl = Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: 15.0.hp,
        actions: [
          // Container(
          //   padding: EdgeInsets.only(right: 5.0.wp, top: 5.0.wp),
          //   child: InkWell(
          //     onTap: () {
          //       Get.to(
          //         HomeScreen(),
          //         binding: HomeBinding(),
          //         // transition: Transition.rightToLeft,
          //         // duration: Duration(seconds: 1),
          //       );
          //     },
          //     child: Text(
          //       'Skip',
          //       style: TextStyle(
          //         color: Colors.grey,
          //         fontSize: 10.0.sp,
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      body: Obx(
        () => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              onPageChanged: (int page) {
                onboardingCtrl.currentIndex.value = page;
              },
              //onboardingCtrl.pageonboardingCtrl,
              children: [
                Image.asset('assets/images/rain.png'),
                Image.asset('assets/images/rain.png'),
                Image.asset('assets/images/rain.png'),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(2.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: onboardingCtrl.buildIndicator(),
                  ),
                  SizedBox(
                    width: 24.0.wp,
                  ),
                  Container(
                    height: 10.0.hp,
                    width: 10.0.wp,
                    // padding: const EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: IconButton(
                        onPressed: () {
                          onboardingCtrl.onboardingRoutes();
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 10.0.sp,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    width: 3.0.wp,
                  ),
                  SizedBox(
                    width: 10.0.wp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
