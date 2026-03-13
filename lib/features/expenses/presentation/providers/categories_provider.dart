import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/budget_category.dart';
import 'expense_repository_provider.dart';

part 'categories_provider.g.dart';

@riverpod
class Categories extends _$Categories {
  @override
  FutureOr<List<BudgetCategory>> build() async {
    return _fetchCategories();
  }

  Future<List<BudgetCategory>> _fetchCategories() async {
    final repository = ref.watch(expenseRepositoryProvider);
    final categories = await repository.getCategories();

    if (categories.isEmpty) {
      final defaultCategories = [
        BudgetCategory(id: const Uuid().v4(), name: 'Food', percentageAllocation: 30, colorHex: '#FF5733', iconName: 'restaurant'),
        BudgetCategory(id: const Uuid().v4(), name: 'Transport', percentageAllocation: 15, colorHex: '#33FF57', iconName: 'directions_car'),
        BudgetCategory(id: const Uuid().v4(), name: 'Housing', percentageAllocation: 40, colorHex: '#3357FF', iconName: 'home'),
      ];
      for (var cat in defaultCategories) {
        await repository.saveCategory(cat);
      }
      return defaultCategories;
    }

    return categories;
  }

  Future<void> addCategory(BudgetCategory category) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(expenseRepositoryProvider);
      await repository.saveCategory(category);
      return _fetchCategories();
    });
  }

  Future<void> updateCategory(BudgetCategory category) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(expenseRepositoryProvider);
      await repository.saveCategory(category);
      return _fetchCategories();
    });
  }

  Future<void> deleteCategory(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(expenseRepositoryProvider);
      await repository.deleteCategory(id);
      return _fetchCategories();
    });
  }
}
