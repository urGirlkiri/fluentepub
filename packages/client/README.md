# Frontend For FluentEpub 

A modern, offline-first WYSIWYG EPUB reader and editor workstation. Built with Flutter for Desktop and the Web.

##  Getting Started

### Prerequisites

* [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.12.0 or higher)

* If developing on Linux, ensure you have the desktop build tools:

```bash
sudo apt-get update
sudo apt-get install -y ninja-build libgtk-3-dev
```

### 1. Install Dependencies

Clone the repository and fetch the Flutter packages:

```bash
flutter pub get

```

### 2. Database Code Generation (Drift)

This project uses Drift for SQL storage. Whenever you modify `lib/database/database.dart`, you must run the build runner to generate the underlying schema mappings:

```bash
dart run build_runner build --delete-conflicting-outputs

```

---

## 🛠️ Running the App

**For Desktop (Linux):**

```bash
flutter run -d linux

```

**For Web (Chrome):**

```bash
flutter run -d chrome

```

*(Note: If you run into build lock issues on Linux due to background SQLite processes, run `rm -f .dart_tool/hooks_runner/shared/sqlite3/.lock` and try again).*
