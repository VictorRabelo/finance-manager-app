import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/expense.dart';
import 'expense_repository_provider.dart';

part 'expenses_provider.g.dart';

@riverpod
class Expenses extends _$Expenses {
  @override
  FutureOr<List<Expense>> build() async {
    return _fetchExpenses();
  }

  Future<List<Expense>> _fetchExpenses() async {
    final repository = ref.watch(expenseRepositoryProvider);
    return await repository.getExpenses();
  }

  Future<void> addExpense(Expense expense) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(expenseRepositoryProvider);
      await repository.saveExpense(expense);
      return _fetchExpenses();
    });
  }

  Future<void> updateExpense(Expense expense) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(expenseRepositoryProvider);
      await repository.saveExpense(expense);
      return _fetchExpenses();
    });
  }

  Future<void> deleteExpense(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(expenseRepositoryProvider);
      await repository.deleteExpense(id);
      return _fetchExpenses();
    });
  }
}
