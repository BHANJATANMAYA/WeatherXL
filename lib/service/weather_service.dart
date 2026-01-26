import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/weathermodel.dart';
import 'package:flutter/foundation.dart';


class WeatherService {
  static const String baseUrl = "Your Api url"; // ex: https://api.openweathermap.org/data/2.5/weather
  final String apiKey = "Your Api key";

  Future<WeatherModel?> getWeather(String city) async {
    try {
      final url = Uri.parse("$baseUrl?q=$city&appid=$apiKey&units=metric");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return WeatherModel.fromJson(data);
      } else {
        debugPrint("Error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      debugPrint("Exception: $e");
      return null;
    }
  }
}

import 'package:geocoding/geocoding.dart';

class WeatherService {

Future<Map<String, dynamic>> getWeather(String location) async {
    try {
      List<Location> locations = await locationFromAddress(location);
      if (locations.isEmpty) {
        throw Exception('Could not find coordinates for location: $location');
      }
      Location loc = locations.first;
      final double latitude = loc.latitude;
      final double longitude = loc.longitude;

final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching weather: $e');
    rethrow;
  }
