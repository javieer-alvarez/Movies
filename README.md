# Peliculas (Flutter)

Flutter app to explore movies using The Movie Database (TMDB) API.

## Requirements

- Flutter 3.x installed and configured (clean `flutter doctor`)
- TMDB account and API Key (free)
  - Create your key: https://www.themoviedb.org/settings/api

## API Key Configuration

The app reads your API key from a compile-time variable using `--dart-define`.

- Variable name: `TMDB_API_KEY`
- If omitted, it defaults to empty and requests will fail (401) or return empty lists.

Examples:

- Run (Android/iOS):
  ```
  flutter run --dart-define=TMDB_API_KEY=YOUR_API_KEY
  ```

- Run (Web):
  ```
  flutter run -d chrome --dart-define=TMDB_API_KEY=YOUR_API_KEY
  ```

- Build APK (release):
  ```
  flutter build apk --dart-define=TMDB_API_KEY=YOUR_API_KEY
  ```

- Build iOS (release):
  ```
  flutter build ios --dart-define=TMDB_API_KEY=YOUR_API_KEY
  ```
  Then distribute via Xcode as needed.

- Build Web:
  ```
  flutter build web --dart-define=TMDB_API_KEY=YOUR_API_KEY
  ```

Tip: create local scripts/aliases to avoid retyping the flag.

## Install & Run

1. Clone the repository
2. Install dependencies:
   ```
   flutter pub get
   ```
3. Run:
   ```
   flutter run --dart-define=TMDB_API_KEY=YOUR_API_KEY
   ```

## Language

- The app requests data in Spanish (`es-ES`) by default when calling TMDB.

## Key Code Locations

- `lib/providers/movies_provider.dart`: loads now-playing, popular movies, search, and suggestions.
- `lib/models/`: TMDB response models.
- `lib/helpers/`: utilities like `Debouncer` and helper methods.

## Troubleshooting

- Empty lists or 401 Unauthorized
  - Ensure `--dart-define=TMDB_API_KEY=YOUR_API_KEY` is provided.
  - Verify your TMDB key is active and not restricted.
- Web CORS issues
  - Use `flutter run -d chrome`. Disable interfering extensions/proxies.
- iOS build issues
  - Open the iOS project in Xcode, accept licenses, run `pod install` if needed.
- Verbose logs
  - Run with `flutter run -v` for detailed output.

## Tests

```
flutter test
```

## Security Notes

- Do not hardcode your API key. Use `--dart-define` or your CI/CD secrets to inject it.
