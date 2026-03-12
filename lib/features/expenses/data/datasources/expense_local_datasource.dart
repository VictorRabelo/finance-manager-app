import '../models/budget_category_model.dart';
import '../models/expense_model.dart';

/// Temporary local datasource implementation.
///
/// This keeps the data layer compiling and testable while Isar generators are
/// being stabilized. Replace this in-memory implementation with Isar-backed
/// collections once `build_runner` generation is available in your environment.
class ExpenseLocalDataSource {
  final List<ExpenseModel> _expenses = <ExpenseModel>[];
  final List<BudgetCategoryModel> _categories = <BudgetCategoryModel>[];

  Future<List<ExpenseModel>> getExpenses() async => List.unmodifiable(_expenses);

  Future<ExpenseModel?> getExpenseById(String id) async {
    for (final expense in _expenses) {
      if (expense.originalId == id) {
        return expense;
      }
    }
    return null;
  }

  Future<void> saveExpense(ExpenseModel expense) async {
    _expenses.removeWhere((item) => item.originalId == expense.originalId);
    _expenses.add(expense);
  }

  Future<void> deleteExpense(String id) async {
    _expenses.removeWhere((item) => item.originalId == id);
  }

  Future<List<BudgetCategoryModel>> getCategories() async =>
      List.unmodifiable(_categories);

  Future<void> saveCategory(BudgetCategoryModel category) async {
    _categories.removeWhere((item) => item.originalId == category.originalId);
    _categories.add(category);
  }

  Future<void> deleteCategory(String id) async {
    _categories.removeWhere((item) => item.originalId == id);
  }
}
