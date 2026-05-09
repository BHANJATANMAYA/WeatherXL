<<<<<<< HEAD

# 🌦️ Weather XL

**Weather XL** is a modern weather application that provides real-time weather updates with a clean, minimal, and user-friendly interface. The goal of this project is simple: **fast, accurate weather info without unnecessary clutter**.

---

## 🚀 Features

* 🌍 Real-time weather data
* 📍 Location-based weather detection
* 🌡️ Current temperature, humidity & weather conditions
* ⏱️ Fast and lightweight performance
* 📱 Responsive and mobile-friendly UI

---

## 🛠️ Tech Stack

* **Frontend:** Flutter
* **Backend / API:** OpenWeatherMap API *(or whatever you're using — accuracy matters)*
* **Language:** Dart
* **Platform:** Android (for now)

---

## ⚙️ Installation & Setup

1. Clone the repository

   ```bash
   git clone https://github.com/your-username/weather-xl.git
   ```

2. Navigate to the project directory

   ```bash
   cd weather-xl
   ```

3. Install dependencies

   ```bash
   flutter pub get
   ```

4. Run the app

   ```bash
   flutter run
   ```

---

## 🔑 API Configuration

1. Get your API key from the weather service you’re using.
2. Add the API key in the appropriate config file

---

## 🧠 Future Improvements

* ⛅ 7-day weather forecast
* 🌙 Dark mode
* 🧭 Manual city search
* 📊 Weather graphs & analytics
* ☁️ Cloud sync & user preferences

---

## 🤝 Contributing

Contributions are welcome, but keep it clean:

* Create a new branch
* Make meaningful commits
* Open a proper Pull Request (no “final_final_v2” crap)

---

## 📜 License

This project is licensed under the **MIT License**.
Feel free to use, modify, and improve it.

---

## 👤 Author

**XL**
Developer | Builder | Learning by shipping real projects


=======
# 🌦️ WeatherXL

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

**WeatherXL** is a modern, production-ready weather application built with Flutter, focused on **speed, clean architecture, and a seamless user experience**.

> ⚡ *No clutter. No confusion. Just accurate weather — instantly.*

---

## 🚀 Features

* 🌍 **Real-time weather data**
* 📍 **Location-based weather detection**
* 🔐 **Authentication system (Firebase)**
* 🌡️ **Temperature, humidity & condition insights**
* ⚠️ **Robust error handling (invalid cities, network issues)**
* ⚡ **Fast startup with optimized routing**
* 🧭 **Clean navigation flow (no back-stack issues)**
* 📱 **Responsive & modern UI with animations (Lottie)**

---

## 🧠 Architecture

This project follows **Clean Architecture + BLoC pattern**, making it scalable and maintainable.

### 🔹 Layers

* **Presentation Layer**

  * Flutter UI
  * `flutter_bloc` for state management

* **Domain Layer**

  * Use cases
  * Business logic

* **Data Layer**

  * Repository pattern
  * Remote data sources (API + Firebase)

### 🔹 Dependency Injection

* Implemented using `get_it` (Service Locator)

👉 Result: **Decoupled, testable, and production-ready codebase**

---

## 🛠️ Tech Stack

* **Frontend:** Flutter
* **State Management:** flutter_bloc
* **Dependency Injection:** get_it
* **Backend/Auth:** Firebase Authentication
* **API:** OpenWeatherMap API *(or your provider)*
* **Language:** Dart
* **Platform:** Android (expanding soon)

---

## ⚙️ Setup & Installation

### 1. Clone the repository

```bash
git clone https://github.com/BHANJATANMAYA/WeatherXL.git
```

### 2. Navigate to project

```bash
cd WeatherXL
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Setup environment variables

Run with API key using `--dart-define`:

```bash
flutter run --dart-define=API_KEY=your_api_key_here
```

### 5. Run the app

```bash
flutter run
```

---

## 🔑 Configuration Notes

* Firebase must be initialized before app startup:

```dart
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
```

* Ensure API keys are **not hardcoded** — use `--dart-define` or secure configs.

---

## 🧯 Recent Improvements

* 🔐 Implemented complete and modern Authentication Flow (Login, Register, Forgot Password)
* 📱 Resolved UI layout overflow issues on Auth screens with responsive `Stack` and `LayoutBuilder` designs
* ⚠️ Added robust error handling for invalid cities on the WeatherPage with immediate user feedback
* ❌ Removed Apple Sign-In (reduced complexity)
* 🔄 Fixed navigation using `pushAndRemoveUntil`
* 🚀 Dynamic startup routing based on auth state
* 🧱 Cleaned Service Locator dependencies
* 🛠️ Fixed Firebase initialization crash

---

## 📸 Screenshots *(Coming Soon)*

> Add UI previews here (Login, Home, Weather screen)

---

## 🧠 Future Roadmap

* ⛅ 7-day / hourly forecast
* 🌙 Dark mode
* 🗺️ Smart city search with suggestions
* 💾 Local caching (offline support)
* ☁️ Cloud sync (user preferences)
* 📊 Weather analytics & charts
* 🌐 Multi-platform (iOS + Web)

---

## 🤝 Contributing

Wanna contribute? Keep it clean:

* Create a feature branch
* Write meaningful commits
* Open a proper PR (no `final_final_v3_last` 😄)

---

## 📜 License

MIT License — use it, improve it, ship it 🚀

---

## 👤 Author

**XL**
*Developer | Builder | Shipping real products*

---

## ⭐ Final Note

This isn’t just a weather app — it’s a **learning project turned real-world product**, built with scalable architecture and production practices.
>>>>>>> dev

