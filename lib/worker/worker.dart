import 'dart:convert';
import 'package:http/http.dart';

class Worker {
    String location;
      Worker(this.location){location = location;}

 String? temp;
String? feelsLike;
String? pressure;
String? humidity;
String? air_speed;
String? description;
String? main;
String? clouds;
String? icon;

 

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=84ebfa08c4f04d014a15b9554e0391ff'));
      Map data = jsonDecode(response.body);

// Getting Description

      List getWeather = data['weather'];
      Map getWeather_main_data = getWeather[0];
      String getIcon = getWeather_main_data['icon'];
      String getDescription = getWeather_main_data['description'];
      String getMainClo = getWeather_main_data['main'];

// Getting Temp, FeelsLike, Pressure, Humidity

      Map getMain = data['main'];
      double getTemp = getMain['temp'] - 273.15;
      double getFeelslike = getMain['feels_like'];
      int getPressure = getMain['pressure'];
      int getHumid = getMain['humidity'];

// Getting wind_speed

      Map getWind = data['wind'];
      double getWindspeed = getWind['speed'];

// Getting clouds

      Map getClouds = data['clouds'];
      int getClo = getClouds['all'];

// Assigning Values

      temp = getTemp.toString();
      feelsLike = getFeelslike.toString();
      pressure = getPressure.toString();
      humidity = getHumid.toString();
      air_speed = getWindspeed.toString();
      description = getDescription.toString();
      main = getMain.toString();
      clouds = getClo.toString();
      icon = getIcon.toString();
    } catch (e) {
      temp = 'Data Not Found';
      feelsLike = 'Data Not Found';
      pressure = 'Data Not Found';
      humidity = 'Data Not Found';
      air_speed = 'Data Not Found';
      description = 'Data Not Found';
      main = 'Data Not Found';
      icon = 'Data Not Found';
      clouds = 'Data Not Found';
    }
  }
}





