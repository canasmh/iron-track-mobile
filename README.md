# Iron Track: A better way to track your routines

## 🤔 Problem Statement

Keeping track of gym workouts using paper logs is inconvenient, easy to misplace, and lacks insights that could help improve performance. Many existing apps are cumbersome and fail to provide a simple yet effective way for users to monitor their progress efficiently.

## 🎯 Mission/Vision

**Mission:** To make tracking workouts effortless and insightful by providing a lightweight, responsive, and user-friendly mobile app.

**Vision:** Empower fitness enthusiasts with tools to effectively monitor their workouts, gain insights, and stay motivated on their fitness journey.
 
## 💡 Key Features

- **💪 Workout Routines:** Create and manage comprehensive workout plans that fit your style. Each routine tracks exercises, sets, reps, and weights with precision, making it easy to follow your preferred training structure.
- **📊 Live Workout Tracking:** Transform your planned routines into guided workout sessions. Track your progress in real-time with built-in timers, rest periods, and performance metrics while Iron Track captures your training data for detailed insights.
- **🏃 Gym-First Design:** Built for the training environment with a clean, intuitive interface. Access everything you need with one hand, even mid-workout, while keeping your focus on form and execution.

## Tech Stack

- **Frontend:** Flutter
- **Backend:** AWS Serverless Architecture
- **Database:** [TBD]
- **Authentication:** [TBD]

## Getting Started

### Project Structure

```
iron_track/
├── client/             # Flutter mobile app
│   ├── lib/
│   │   ├── core/       # Shared utilities, themes, widgets
│   │   ├── features/   # Feature-based modules
│   │   └── shared/     # Shared business logic
│   └── test/           # Tests mirror lib/ structure
├── docs/
│   └── requirements/   # Functional and non-functional requirements
└── hooks/              # Git hooks for development
```

### Prerequisites
- Flutter SDK >=3.16.0
- Dart SDK >=3.2.0
- VS Code + Flutter/Dart extensions
- Git

#### Key Dependencies
- `font_awesome_flutter`: Icons and branding
- `flutter_lints`: Code quality and style

#### For iOS development:
- macOS (for iOS builds)
- Xcode >=15.0
- CocoaPods


#### For Android development:
- Android SDK
- Android Studio or Command-line tools

### Setup
1. Copy the pre-commit hook:
    ```bash
    cp hooks/pre-commit .git/hooks/
    chmod +x .git/hooks/pre-commit
    ```

2. VS Code:
    - Project settings are provided in `.vscode/settings.json`
    - Use F5 to run/debug the app
3. Testing:
    - Tests mirror the source code structure
    - Run tests: `flutter test`

## Documentation

### Project Documentation
Comprehensive documentation is maintained in the [`docs/`](/docs) directory, including:
- Functional Requirements (FRs)
- Non-Functional Requirements (NFRs)
- API Specifications
- Architecture Decisions (ADRs)
- System Design Documents

### Version History
All notable changes, updates, and version releases are documented in [`CHANGELOG.md`](/CHANGELOG.md) in the root directory.

## Development Status

### 🚧 Currently in Development 🚧

We are in the early stages of development. The current focus is on:

- Setting up project infrastructure
- Defining core features
- Creating basic UI components

## Contributing

We welcome contributions! Our contributing guidelines will be provided once it is available.

### Prerequisites

Project Prequisites will be updated as project progresses.

### Setup
_Development setup instructions coming soon_

## License

This project is proprietary software. See [LICENSE.md](https://github.com/canasmh/iron-track-mobile/blob/main/LICENSE.md) for details.

## Contact

Manuel Canas (_Owner_) [canasmh.github.io](canasmh.github.io)

---

_README is under active development and will be updated as the project progresses._
