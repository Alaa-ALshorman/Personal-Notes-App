# Personal Notes App

A lightweight and efficient note-taking application built with Flutter. This app allows users to capture their thoughts and manage tasks with a seamless local storage experience.

## Features

- **Create & Manage Notes:** Add, view, and organize your personal thoughts easily.
- **Local Storage:** Securely save your notes on your device using `shared_preferences`.
- **Clean UI:** A simple and intuitive user interface designed with Flutter widgets.
- **Offline Access:** Access your saved notes anytime without needing an internet connection.

## Tech Stack

- **Framework:** [Flutter](https://flutter.dev)
- **Language:** [Dart](https://dart.dev)
- **Local Database:** [shared_preferences](https://pub.dev/packages/shared_preferences)

## Getting Started

Follow these steps to run the project locally:

```bash
# Clone the repository
git clone [https://github.com/Alaa-ALshorman/Personal-Notes-App.git](https://github.com/Alaa-ALshorman/Personal-Notes-App.git)

# Enter the project directory
cd Personal-Notes-App

# Install dependencies
flutter pub get

# Run the application
flutter run
## Assets Requirements

To maintain high-quality app icons, ensure the source images follow these specifications:

- **Dimensions:** 1024 × 1024 px
- **Format:** PNG (No transparency for the main icon)
- **Design:** Simple, centered design with no text near edges.

### Icon Directory Structure
```text
assets/
└── icon/
    ├── icon.png (1024x1024, flat)
    └── icon_foreground.png (transparent, centered)