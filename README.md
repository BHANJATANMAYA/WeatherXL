
# 🌦️ WeatherXL

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
git clone https://github.com/your-username/weather-xl.git
```

### 2. Navigate to project

```bash
cd weather-xl
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

* ❌ Removed Apple Sign-In (reduced complexity)
* 🔄 Fixed navigation using `pushAndRemoveUntil`
* 🚀 Dynamic startup routing based on auth state
* 🧱 Cleaned Service Locator dependencies
* 🛠️ Fixed Firebase initialization crash
* ⚠️ Improved error handling & user feedback

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

