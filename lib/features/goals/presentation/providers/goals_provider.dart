import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/database/database_provider.dart';
import '../../domain/entities/goal.dart';
import '../../data/models/goal_model.dart';
import 'package:isar/isar.dart';

part 'goals_provider.g.dart';

@riverpod
class Goals extends _$Goals {
  @override
  FutureOr<List<Goal>> build() async {
    return _fetchGoals();
  }

  Future<List<Goal>> _fetchGoals() async {
    final isar = ref.watch(isarProvider);
    final models = await isar.collection<GoalModel>().where().findAll();
    return models.map((m) => Goal(
      id: m.originalId,
      name: m.name,
      targetAmount: m.targetAmount,
      currentAmount: m.currentAmount,
    )).toList();
  }

  Future<void> addGoal(Goal goal) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final isar = ref.read(isarProvider);
      final model = GoalModel()
        ..originalId = goal.id
        ..name = goal.name
        ..targetAmount = goal.targetAmount
        ..currentAmount = goal.currentAmount;

      await isar.writeTxn(() async {
        await isar.collection<GoalModel>().put(model);
      });
      return _fetchGoals();
    });
  }

  Future<void> updateGoal(Goal goal) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final isar = ref.read(isarProvider);
      final model = GoalModel()
        ..originalId = goal.id
        ..name = goal.name
        ..targetAmount = goal.targetAmount
        ..currentAmount = goal.currentAmount;

      await isar.writeTxn(() async {
        await isar.collection<GoalModel>().put(model);
      });
      return _fetchGoals();
    });
  }

  Future<void> deleteGoal(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final isar = ref.read(isarProvider);
      await isar.writeTxn(() async {
        final model = await isar.collection<GoalModel>().filter().originalIdEqualTo(id).findFirst();
        if (model != null) {
          await isar.collection<GoalModel>().delete(model.id);
        }
      });
      return _fetchGoals();
    });
  }
}
