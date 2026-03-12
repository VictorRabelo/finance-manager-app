import 'package:isar/isar.dart';
import '../models/expense_model.dart';
import '../models/budget_category_model.dart';

class ExpenseLocalDataSource {
  final Isar isar;

  ExpenseLocalDataSource(this.isar);

  Future<List<ExpenseModel>> getExpenses() async {
    return await isar.expenseModels.where().findAll();
  }

  Future<ExpenseModel?> getExpenseById(String id) async {
    return await isar.expenseModels.filter().originalIdEqualTo(id).findFirst();
  }

  Future<void> saveExpense(ExpenseModel expense) async {
    await isar.writeTxn(() async {
      await isar.expenseModels.put(expense);
    });
  }

  Future<void> deleteExpense(String id) async {
    await isar.writeTxn(() async {
      await isar.expenseModels.filter().originalIdEqualTo(id).deleteAll();
    });
  }

  Future<List<BudgetCategoryModel>> getCategories() async {
    return await isar.budgetCategoryModels.where().findAll();
  }

  Future<void> saveCategory(BudgetCategoryModel category) async {
    await isar.writeTxn(() async {
      await isar.budgetCategoryModels.put(category);
    });
  }

  Future<void> deleteCategory(String id) async {
    await isar.writeTxn(() async {
      await isar.budgetCategoryModels.filter().originalIdEqualTo(id).deleteAll();
    });
  }
}
