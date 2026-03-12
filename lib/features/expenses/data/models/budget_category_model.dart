import 'package:isar/isar.dart';

part 'budget_category_model.g.dart';

@collection
class BudgetCategoryModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String originalId;

  late String name;
  late double percentageAllocation;
  late String colorHex;
  late String iconName;
}
