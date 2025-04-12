import 'package:flutter/material.dart';
import 'package:untitled/models/weathermodel.dart';
import 'package:untitled/services/weatherservice.dart';

class WeatherProvider extends ChangeNotifier
{
  WeatherModel? weatherModel;
  Future<void> fetchcity(String city) async
  {
    weatherModel = await WeatherService.getweather(city);
    notifyListeners();
  }
}