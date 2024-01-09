import 'package:get/get.dart';
import 'package:weather/weather_app/data/api/services/weather_service.dart';
import 'package:weather/weather_app/models/current_weather_data.dart';
import 'package:weather/weather_app/models/five_days_data.dart';
import 'package:weather/weather_app/modules/welcome/controller.dart';

class HomeController extends GetxController {
  bool is_loading = true;
  WelcomeController welcomeController = Get.put(WelcomeController());

  @override
  void onInit() {
    initState();
    getTopFiveCities();
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
    welcomeController.changeIndex(0);
  }

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];
  String? city;
  String? searchText;

  HomeController({required this.city});

  void getCurrentWeatherData() {
    WeatherService(city: '$city').getCurrentWeatherData(
        onSuccess: (data) {
          is_loading = true;
          currentWeatherData = data;

          is_loading = false;
          update();
        },
        onError: (error) => {
              is_loading = true,
              print(error),
              is_loading = false,
              update(),
            });
  }

  void getTopFiveCities() {
    List<String> cities = [
      'zagazig',
      'cairo',
      'alexandria',
      'ismailia',
      'fayoum'
    ];
    cities.forEach((c) {
      WeatherService(city: '$c').getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        print(error);
        update();
      });
    });
  }

  void getFiveDaysData() {
    WeatherService(city: '$city').getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
      is_loading = true;
      fiveDaysData = data;
      is_loading = false;
      update();
    }, onError: (error) {
      is_loading = true;
      print(error);
      is_loading = false;
      update();
    });
  }
}
