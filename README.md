


# weather

Weather App v1 is ready Inspiration in UI/UX design comes with time .
V1 OF THIS APP IS IN BRANCH:
  *  -DEVELOP
    -API_INTEGRATION
    -UI_DESIGN
    -PROD_IOS
    -PROD_ANDROID
    -CLEAN_CODE
## Getting Started

The project's architecture was organized into clean, distinct folders :  

core :------------------------------------

    -theme
    -utils : 
         -extentions.dart for responsive Ui and size Icons , texts ..
    -values

data :------------------------------------

    -api : 
        - repositories:
        - services:
        -testing:
    -local_db: local storage ... 

models :------------------------------------

    -models of api and local_db.

modules :------------------------------------

    -home: 
        -widgets:  all shared widgets module .
        binding.dart :binding of logique code module .
        controller.dart :logique code module .
        view.dart : view of home screen module .
    -welcome: 
        -widgets:  all shared widgets module .
        binding.dart :binding of logique code module .
        controller.dart :logique code module .
        view.dart : view of home screen module .

widgets :------------------------------------

   all shared widgets of modules.

translations: ------------------------------------

   logique of multilang ... 

   main.dart   ------------------------------------

I use Dio Package:

    -Dio supports various HTTP methods like GET, POST, PUT, DELETE, etc.
    -It allows you to add headers, query parameters, and other request configurations easily.
    -Supports sending and receiving JSON data.
    -It provides features like interceptors for handling requests and responses, -cancellation of requests, etc.
    -Dio supports sending files in HTTP requests.
    -It has a convenient way to handle timeouts and retries.



Users can now search for cities globally with an implemented search feature, enhancing usability.

I streamlined state management using GetX, harnessing its reactive nature for efficient UI updates.

Animated lotties were seamlessly integrated using the LottiePackage, elevating the visual appeal.

For network errors, connectivity_plus ensured smooth error handling, ensuring a seamless user experience.



A dark theme was added to provide users with an alternative visual experience.



API models and repository were built using OpenWeatherMap data for robust data handling.

- [Explore the weather API at : ](https://openweathermap.org/api)
 
