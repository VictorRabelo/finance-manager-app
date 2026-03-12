import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_category.freezed.dart';
part 'budget_category.g.dart';

@freezed
class BudgetCategory with _$BudgetCategory {
  const factory BudgetCategory({
    required String id,
    required String name,
    required double percentageAllocation,
    required String colorHex,
    required String iconName,
  }) = _BudgetCategory;

  factory BudgetCategory.fromJson(Map<String, dynamic> json) => _$BudgetCategoryFromJson(json);
}
