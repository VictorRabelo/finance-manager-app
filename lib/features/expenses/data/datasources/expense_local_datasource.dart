import 'package:isar/isar.dart';

import '../models/budget_category_model.dart';
import '../models/expense_model.dart';

class ExpenseLocalDataSource {
  final Isar isar;

  ExpenseLocalDataSource(this.isar);

  Future<List<ExpenseModel>> getExpenses() async {
    return isar.expenseModels.where().findAll();
  }

  Future<ExpenseModel?> getExpenseById(String id) async {
    return isar.expenseModels.filter().originalIdEqualTo(id).findFirst();
  }

  Future<void> saveExpense(ExpenseModel expense) async {
    await isar.writeTxn(() async {
      await isar.expenseModels.put(expense);
    });
  }

  Future<void> deleteExpense(String id) async {
    await isar.writeTxn(() async {
      final expense = await getExpenseById(id);
      if (expense != null) {
        await isar.expenseModels.delete(expense.id);
      }
    });
  }

  Future<List<BudgetCategoryModel>> getCategories() async {
    return isar.budgetCategoryModels.where().findAll();
  }

  Future<void> saveCategory(BudgetCategoryModel category) async {
    await isar.writeTxn(() async {
      await isar.budgetCategoryModels.put(category);
    });
  }

  Future<void> deleteCategory(String id) async {
    await isar.writeTxn(() async {
      final category = await isar.budgetCategoryModels.filter().originalIdEqualTo(id).findFirst();
      if (category != null) {
        await isar.budgetCategoryModels.delete(category.id);
      }
    });
  }
}
