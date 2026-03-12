import 'package:isar/isar.dart';

part 'expense_model.g.dart';

@collection
class ExpenseModel {
  Id id = Isar.autoIncrement; // you can also use id = fastHash(stringId)

  @Index(unique: true, replace: true)
  late String originalId;

  late double amount;
  late String description;
  late DateTime date;
  late String categoryId;

  String? attachmentPath;
  String? voiceNotePath;
}
