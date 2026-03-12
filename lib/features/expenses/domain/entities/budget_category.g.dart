// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BudgetCategory _$BudgetCategoryFromJson(Map<String, dynamic> json) =>
    _BudgetCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      percentageAllocation: (json['percentageAllocation'] as num).toDouble(),
      colorHex: json['colorHex'] as String,
      iconName: json['iconName'] as String,
    );

Map<String, dynamic> _$BudgetCategoryToJson(_BudgetCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'percentageAllocation': instance.percentageAllocation,
      'colorHex': instance.colorHex,
      'iconName': instance.iconName,
    };
