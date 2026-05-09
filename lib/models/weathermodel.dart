class WeatherModel {
  final String cityName;
  final double temperature;
  final String description;
  final String icon;
  final int humidity;
  final double windSpeed;
  final double precipitation;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
    required this.precipitation,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    // OpenWeatherMap current weather endpoint optionally includes rain.
    final rain = json["rain"];
    final rain1h = rain != null ? (rain["1h"]?.toDouble() ?? 0.0) : 0.0;

    return WeatherModel(
      cityName: json["name"],
      temperature: json["main"]["temp"]?.toDouble() ?? 0.0,
      description: json["weather"][0]["description"],
      icon: json["weather"][0]["icon"],
      humidity: json["main"]["humidity"]?.toInt() ?? 0,
      windSpeed: json["wind"]["speed"]?.toDouble() ?? 0.0,
      precipitation: rain1h,
    );
  }
}
