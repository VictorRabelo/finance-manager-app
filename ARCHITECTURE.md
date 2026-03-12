# Architecture & Product Strategy Document

## 1. Recommended Folder Structure
We are employing a Clean Architecture feature-first approach.
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

## 2. Chosen State Management Approach and Rationale
**Riverpod**
We are using `flutter_riverpod` (specifically `riverpod_annotation` for code generation).
*Rationale*: Riverpod is scalable, safe at compile-time, prevents `ProviderNotFound` exceptions, handles asynchronous state elegantly (using `AsyncValue`), and natively supports dependency injection testing out of the box, making it perfect for a complex enterprise-grade application like this.

## 3. Chosen Local Database Strategy and Rationale
**Isar**
*Rationale*: Isar is highly performant (built in Rust), strongly typed, supports full-text search, handles relationships effortlessly, and supports complex queries, making it much more robust than simpler key-value stores like Hive for relational data structures such as Categories and Expenses.

## 4. Domain Entities
- `BudgetCategory` (id, name, percentageAllocation, colorHex, iconName)
- `Expense` (id, amount, description, date, categoryId, attachmentPath, voiceNotePath)
- `Goal` (id, targetAmount, currentAmount, deadline, status)
- `Attachment` / `VoiceEntry` (represented internally in Expense for the MVP)

## 5. Data Models and Mappers
Isar requires specific collections. We map Domain Entities to Data Models using factory methods or manual mappers in the repository layer.
- `ExpenseModel` (Isar collection) -> mapped to `Expense` (Freezed Domain Entity).
- `BudgetCategoryModel` (Isar collection) -> mapped to `BudgetCategory`.

## 6. Repository Contracts and Implementations
- `ExpenseRepository` (Domain Contract) defines methods: `getExpenses`, `saveExpense`, etc.
- `ExpenseRepositoryImpl` (Data Implementation) handles fetching from `ExpenseLocalDataSource` (Isar).

## 7. Use Cases
- `AddExpenseUseCase`
- `GetExpensesUseCase`
- `UpdateBudgetCategoryUseCase`
All use cases return `Either<Failure, T>` using `dartz` to strictly handle domain errors.

## 8. Navigation Structure
**GoRouter**
Structured routing using `GoRouter`.
We implement a `ShellRoute` to handle bottom navigation persisting across tabs (`/home`, `/expenses`, `/goals`, `/history`, `/settings`), allowing native feeling page transitions.

## 9. Theme System
Material 3 design system implemented via `ThemeData`.
- `AppTheme.lightTheme`
- `AppTheme.darkTheme`
Centralized for colors, typography, shapes, and elevation to maintain consistency.

## 10. Localization-ready Structure
Utilizing `intl`. The current setup expects ARB files under an `l10n/` folder so adding multi-language support (like the web app's language toggle) is seamless.

## 11. MVP Screen List
- **HomePage**: Dashboard summary, quick FAB.
- **ExpensesPage**: List with filters, search, and expense details.
- **GoalsPage**: Cards of goals, progress bars.
- **HistoryPage**: Monthly/yearly insights, charts.
- **SettingsPage**: Budget configs, categories, UI preferences.

## 12. UI/UX Redesign Decisions
- Moved away from web top-nav tabs. Used `NavigationBar` at the bottom for thumb accessibility.
- Single global Floating Action Button for the most frequent user action: "Add Expense".
- Use Bottom Sheets for quick entries (voice and manual) instead of massive dialogs.
- Clear typographic hierarchy utilizing cards with soft shadows and rounded corners (Material 3).

## 13. Implementation Roadmap by Priority
1. **Foundation (Current)**: Architecture, DI, Routing, Base UI.
2. **Core Feature**: Expense entry (Manual + Isar integration).
3. **Advanced Entry**: Voice parsing & PDF local storage integration.
4. **Dashboard & History**: Aggregating Isar data for insights.
5. **Goals & Budget config**: Allowing users to adjust category percentages and track progress.

## 14. Initial Code Skeleton
The foundation of Riverpod providers, GoRouter setup, Freezed models, Isar collections, and Clean Architecture layers have been fully scaffolded.

## 15. Production-Quality Naming and Organization
All naming conventions follow Dart guidelines (e.g., lowercase_with_underscores for files, PascalCase for classes). Responsibilities are isolated tightly following SOLID principles (Widgets shouldn't talk to Isar directly, they talk to Providers -> UseCases -> Repositories -> DataSources).
