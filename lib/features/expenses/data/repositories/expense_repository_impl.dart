import '../../domain/entities/expense.dart';
import '../../domain/entities/budget_category.dart';
import '../../domain/repositories/expense_repository.dart';
import '../datasources/expense_local_datasource.dart';
import '../models/expense_model.dart';
import '../models/budget_category_model.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseLocalDataSource localDataSource;

  ExpenseRepositoryImpl(this.localDataSource);

  @override
  Future<List<Expense>> getExpenses() async {
    final models = await localDataSource.getExpenses();
    return models.map((e) => Expense(
      id: e.originalId,
      amount: e.amount,
      description: e.description,
      date: e.date,
      categoryId: e.categoryId,
      attachmentPath: e.attachmentPath,
      voiceNotePath: e.voiceNotePath,
    )).toList();
  }

  @override
  Future<Expense> getExpenseById(String id) async {
    final model = await localDataSource.getExpenseById(id);
    if (model == null) throw Exception('Expense not found');
    return Expense(
      id: model.originalId,
      amount: model.amount,
      description: model.description,
      date: model.date,
      categoryId: model.categoryId,
      attachmentPath: model.attachmentPath,
      voiceNotePath: model.voiceNotePath,
    );
  }

  @override
  Future<void> saveExpense(Expense expense) async {
    final model = ExpenseModel()
      ..originalId = expense.id
      ..amount = expense.amount
      ..description = expense.description
      ..date = expense.date
      ..categoryId = expense.categoryId
      ..attachmentPath = expense.attachmentPath
      ..voiceNotePath = expense.voiceNotePath;
    await localDataSource.saveExpense(model);
  }

  @override
  Future<void> deleteExpense(String id) async {
    await localDataSource.deleteExpense(id);
  }

  @override
  Future<List<BudgetCategory>> getCategories() async {
    final models = await localDataSource.getCategories();
    return models.map((e) => BudgetCategory(
      id: e.originalId,
      name: e.name,
      percentageAllocation: e.percentageAllocation,
      colorHex: e.colorHex,
      iconName: e.iconName,
    )).toList();
  }

  @override
  Future<void> saveCategory(BudgetCategory category) async {
    final model = BudgetCategoryModel()
      ..originalId = category.id
      ..name = category.name
      ..percentageAllocation = category.percentageAllocation
      ..colorHex = category.colorHex
      ..iconName = category.iconName;
    await localDataSource.saveCategory(model);
  }

  @override
  Future<void> deleteCategory(String id) async {
    await localDataSource.deleteCategory(id);
  }
}
