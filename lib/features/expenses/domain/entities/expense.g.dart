// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Expense _$ExpenseFromJson(Map<String, dynamic> json) => _Expense(
  id: json['id'] as String,
  amount: (json['amount'] as num).toDouble(),
  description: json['description'] as String,
  date: DateTime.parse(json['date'] as String),
  categoryId: json['categoryId'] as String,
  attachmentPath: json['attachmentPath'] as String?,
  voiceNotePath: json['voiceNotePath'] as String?,
);

Map<String, dynamic> _$ExpenseToJson(_Expense instance) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'description': instance.description,
  'date': instance.date.toIso8601String(),
  'categoryId': instance.categoryId,
  'attachmentPath': instance.attachmentPath,
  'voiceNotePath': instance.voiceNotePath,
};
