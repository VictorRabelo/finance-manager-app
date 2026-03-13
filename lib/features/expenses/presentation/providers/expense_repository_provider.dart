import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../data/datasources/expense_local_datasource.dart';
import '../../data/repositories/expense_repository_impl.dart';
import '../../domain/repositories/expense_repository.dart';

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  final isar = ref.watch(isarProvider);
  final localDataSource = ExpenseLocalDataSource(isar);
  return ExpenseRepositoryImpl(localDataSource);
});
