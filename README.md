# Películas 🎬 (Flutter)

A modern **Flutter movie discovery app** that lets users explore now-playing and popular movies using **The Movie Database (TMDB) API**.

The app focuses on clean UI, responsive layouts, and efficient API consumption across **Android, iOS, and Web**.

---

## 📱 Overview

**Películas** allows users to:
- Browse **now-playing** and **popular** movies
- Search movies by title
- View detailed movie information
- Get live suggestions while typing (debounced search)
- Explore a clean, scroll-friendly movie catalog

This project was built to practice:
- Flutter UI patterns
- State management with providers
- REST API integration
- Secure handling of API keys

---

## 🛠️ Tech Stack

- **Flutter** — cross-platform UI framework  
- **Dart** — application logic  
- **TMDB API** — movie data provider  
- **Provider** — state management  
- **HTTP** — REST API consumption  

---

## 🚀 Getting Started

### Prerequisites

- **Flutter 3.x** installed and configured  
  ```bash
  flutter doctor
  ```
- A **TMDB account** and **API Key** (free)

Create your API key here:  
👉 https://www.themoviedb.org/settings/api

---

## 🔐 API Key Configuration (Important)

This app **does not hardcode secrets**.

The TMDB API key is injected at **compile time** using `--dart-define`.

- Variable name: `TMDB_API_KEY`
- If omitted, requests will fail (`401 Unauthorized`) or return empty lists.

### Examples

#### Run (Android / iOS)
```bash
flutter run --dart-define=TMDB_API_KEY=YOUR_API_KEY
```

#### Run (Web)
```bash
flutter run -d chrome --dart-define=TMDB_API_KEY=YOUR_API_KEY
```

#### Build APK (release)
```bash
flutter build apk --dart-define=TMDB_API_KEY=YOUR_API_KEY
```

#### Build iOS (release)
```bash
flutter build ios --dart-define=TMDB_API_KEY=YOUR_API_KEY
```
Then distribute via Xcode as needed.

#### Build Web
```bash
flutter build web --dart-define=TMDB_API_KEY=YOUR_API_KEY
```

💡 Tip: create local scripts or shell aliases to avoid retyping the flag.

---

## 📦 Install & Run

1. Clone the repository
   ```bash
   git clone https://github.com/javieer-alvarez/Peliculas.git
   cd Peliculas
   ```

2. Install dependencies
   ```bash
   flutter pub get
   ```

3. Run the app
   ```bash
   flutter run --dart-define=TMDB_API_KEY=YOUR_API_KEY
   ```

---

## 🌍 Language & Localization

- The app requests movie data in **Spanish** by default:
  ```
  es-ES
  ```
- This can be easily changed in the API request configuration.

---

## 🧠 Architecture Overview

The project follows a clean, modular structure:

```text
lib/
 ├─ providers/
 │   └─ movies_provider.dart
 ├─ models/
 │   └─ TMDB response models
 ├─ helpers/
 │   ├─ debouncer.dart
 │   └─ utility helpers
 ├─ screens/
 ├─ widgets/
 └─ main.dart
```

### Key Files

- `movies_provider.dart`  
  Loads:
  - Now-playing movies
  - Popular movies
  - Search results
  - Suggestions with debounce

- `models/`  
  Strongly-typed TMDB API response models.

- `helpers/`  
  Utilities such as `Debouncer` for optimized search.

---

## 🧪 Tests

Run all tests with:

```bash
flutter test
```

---

## 🛠️ Troubleshooting

### Empty lists or `401 Unauthorized`
- Ensure `--dart-define=TMDB_API_KEY=YOUR_API_KEY` is provided.
- Verify your TMDB key is active and unrestricted.

### Web CORS issues
- Use:
  ```bash
  flutter run -d chrome
  ```
- Disable interfering browser extensions or proxies.

### iOS build issues
- Open the iOS project in Xcode
- Accept licenses if prompted
- Run `pod install` if needed

### Verbose logs
```bash
flutter run -v
```

---

## 🔒 Security Notes

- ❌ Never hardcode API keys
- ✅ Use `--dart-define` or CI/CD secrets
- ✅ Safe for public GitHub repositories
- ❌ Do not commit `.env` or secret config files

---

## 💡 Future Improvements

- Movie favorites & watchlist
- Genre-based filtering
- User ratings & reviews
- Offline caching
- Dark mode enhancements

---

<div align="center">
Made with ❤️ using Flutter & TMDB
</div>
