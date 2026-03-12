import '../entities/expense.dart';
import '../entities/budget_category.dart';

abstract class ExpenseRepository {
  Future<List<Expense>> getExpenses();
  Future<Expense> getExpenseById(String id);
  Future<void> saveExpense(Expense expense);
  Future<void> deleteExpense(String id);

  Future<List<BudgetCategory>> getCategories();
  Future<void> saveCategory(BudgetCategory category);
  Future<void> deleteCategory(String id);
}
