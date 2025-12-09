import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'weather_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF93A3FD), // top color
              Color(0xFFBCC3FA), // bottom color
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
  decoration: BoxDecoration(
    shape: BoxShape.circle, // make it circular
    boxShadow: [
      BoxShadow(
        color: const Color(0xFF6F7FF0).withValues(alpha:0.6), // glow color
        blurRadius: 40, // makes the glow softer
        spreadRadius: 10, // expands the glow
      ),
    ],
  ),
  child: Lottie.asset(
    'assets/home_ani.json',
    height: 200,
    width: 200,
    fit: BoxFit.contain,
  ),
),


              const SizedBox(height: 100),
              const Text(
                "Weather",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1,
                ),
              ),
              const Text(
                "Forecasts",
                style: TextStyle(
                  fontSize: 52,
                  color: Colors.white,
                  height: 1,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF314CE5), // left color
                      Color(0xFF4B70F4), // right color
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha:0.3),
                      offset: const Offset(0, 4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  onPressed: () {
                    HapticFeedback.vibrate();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WeatherPage()),
                    );
                  },
                  child: const Text(
                    "Get Start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
