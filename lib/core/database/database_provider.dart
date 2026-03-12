import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/expenses/data/models/expense_model.dart';
import '../../features/expenses/data/models/budget_category_model.dart';
import '../../features/goals/data/models/goal_model.dart';

final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('isarProvider must be overridden in main.dart');
});

class DatabaseProvider {
  static Future<Isar> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [ExpenseModelSchema, BudgetCategoryModelSchema, GoalModelSchema],
      directory: dir.path,
    );
  }
}
