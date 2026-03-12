import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class AddExpense {
  final ExpenseRepository repository;

  AddExpense(this.repository);

  Future<Either<Failure, void>> call(Expense expense) async {
    try {
      if (expense.amount <= 0) {
        return Left(Failure('Amount must be greater than zero.'));
      }
      if (expense.description.isEmpty) {
        return Left(Failure('Description cannot be empty.'));
      }

      await repository.saveExpense(expense);
      return const Right(null);
    } catch (e) {
      return Left(Failure('Failed to save expense: ${e.toString()}'));
    }
  }
}
