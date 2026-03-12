# 💰 Finance Manager App (Flutter MVP)

A modern, scalable, local-first personal finance mobile application built with **Flutter**, designed using **Clean Architecture**, **SOLID principles**, and **enterprise-grade state management**.

This project serves as a **product validation MVP** focused on fast data entry, intuitive UX, and future scalability for sync/API features.

---

## 🚀 Product Vision

Finance Manager aims to provide users with a fast, elegant, and intelligent way to:

* Track expenses
* Manage budget categories
* Set financial goals
* Attach receipts (PDF)
* Use voice-assisted expense entry
* View insights and historical spending trends

The architecture is designed to **evolve into a production-ready SaaS/mobile product**.

---

## 🧠 Architecture Overview

This project follows a **feature-first Clean Architecture approach**.

```
lib/
├── core/
│   ├── routing/
│   ├── theme/
│   ├── utils/
│   └── errors/
├── features/
│   ├── home/
│   │   ├── presentation/
│   │   ├── domain/
│   │   └── data/
│   ├── expenses/
│   │   ├── presentation/
│   │   ├── domain/
│   │   └── data/
│   ├── goals/
│   ├── history/
│   └── settings/
├── shared/
│   └── widgets/
└── main.dart
```

### Architectural Flow

```
UI (Widgets / Pages)
        ↓
Riverpod Providers
        ↓
UseCases (Domain)
        ↓
Repositories (Contracts)
        ↓
Repository Implementations
        ↓
Local Data Sources (Isar)
```

---

## ⚙️ Tech Stack

### State Management

* **Riverpod (Code Generation)**
* Compile-time safety
* Strong dependency injection model
* Async state handling with `AsyncValue`

### Navigation

* **GoRouter**
* ShellRoute with persistent bottom navigation

### Local Database

* **Isar Database**
* High-performance local storage
* Strong typing
* Relationship support
* Scalable querying

### Domain Modeling

* **Freezed**
* Immutable entities
* Pattern matching
* Clean serialization support

### Functional Error Handling

* **Dartz**
* `Either<Failure, T>` return pattern

### Additional Packages

* `speech_to_text` → Voice expense entry
* `record` → Audio note recording
* `file_picker` → PDF attachments
* `intl` → Localization ready
* `uuid` → Entity identifiers

---

## 📱 MVP Features

### Home Dashboard

* Monthly summary
* Budget usage preview
* Goal progress highlights
* Quick add expense FAB

### Expenses

* Expense list with filters
* Manual expense entry
* Voice-assisted entry
* PDF receipt attachment

### Goals

* Goal cards with progress bars
* Contribution tracking

### History

* Monthly / yearly insights
* Category breakdown
* Trend visualization (planned)

### Settings

* Budget configuration
* Category percentage allocation
* Theme & preferences

---

## 🎨 UX Design Principles

* Mobile-first navigation (Material 3 NavigationBar)
* Thumb-friendly interactions
* Bottom sheets for quick actions
* Card-based hierarchy
* Minimal friction data entry
* Light & Dark theme support
* Future-ready micro-interaction design

---

## 🌍 Localization

The project is prepared for internationalization using `intl`.

ARB files are expected under:

```
lib/l10n/
```

---

## 🧩 Domain Entities

* **BudgetCategory**
* **Expense**
* **Goal**

For MVP simplicity:

* Attachment and VoiceNote are embedded within Expense.

---

## 🗺️ Implementation Roadmap

### Phase 1 (Current)

* Base architecture
* Routing
* Theme system
* Feature scaffolding

### Phase 2

* Expense CRUD with Isar
* Category management

### Phase 3

* Voice parsing integration
* PDF attachment persistence

### Phase 4

* Dashboard aggregation
* Historical analytics

### Phase 5

* Goals tracking & budget optimization
* UX polish & product validation

---

## ▶️ Running the Project

### Install dependencies

```
flutter pub get
```

### Generate code (Riverpod / Freezed / JSON)

```
dart run build_runner build --delete-conflicting-outputs
```

### Run the application

```
flutter run
```

---

## 🧪 Development Mode (Recommended)

Run code generation watcher:

```
dart run build_runner watch --delete-conflicting-outputs
```

---

## 🔮 Future Roadmap

* Cloud sync
* Authentication
* Multi-device data consistency
* AI-powered financial insights
* Subscription-based SaaS model
* Production analytics dashboard

---

## 👨‍💻 Author

Built as part of a **product engineering and SaaS validation journey**, focusing on scalable mobile architecture and modern UX design.
