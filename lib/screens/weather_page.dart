import 'package:flutter/material.dart';
import 'package:myapp/models/weathermodel.dart';
import 'package:myapp/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherService _weatherService = WeatherService();
  WeatherModel? _weather;
  bool _isLoading = false;
  final TextEditingController _controller = TextEditingController();

  void _fetchWeather() async {
    if (_controller.text.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    final weather = await _weatherService.getWeather(_controller.text);

    setState(() {
      _weather = weather;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F0FF), // light pastel bg
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Weather", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔎 Search box
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter city name",
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _fetchWeather,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            //  Weather display
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_weather != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      //  Location + Date
                      Text(
                        _weather!.cityName,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${DateTime.now().toLocal()}".split(' ')[0],
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      //  Temperature + Condition
                      Text(
                        "${_weather!.temperature.toStringAsFixed(1)}°",
                        style: const TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        _weather!.description,
                        style: const TextStyle(
                            fontSize: 20, color: Colors.black54),
                      ),
                      const SizedBox(height: 20),

                      // Icon
                      Image.network(
                        "https://openweathermap.org/img/wn/${_weather!.icon}@4x.png",
                        width: 120,
                        height: 120,
                      ),
                      const SizedBox(height: 20),

                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildInfoCard("💧", "Humidity",
                              "${(_weather!.temperature * 2).toInt()}%"),
                          _buildInfoCard("🌬️", "Wind", "12 km/h"),
                          _buildInfoCard("☔", "Precip.", "30%"),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              )
            else
              const Expanded(
                child: Center(
                  child: Text(
                    "Search for a city to see the weather 🌍",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 6, offset: const Offset(0, 3))
        ],
      ),
      child: Column(
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
