import 'package:clima/services/Location.dart';
import 'package:clima/services/Networking.dart';


class WeatherModel {

  static const String apiKey = 'cd4625f5470757c68382b537fb253c44';

  static Future<dynamic> getLocationWeather() async {
    Location location = new Location();
    await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?'
        'lat=${location.lat}&lon=${location.long}&appid=$apiKey');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
