// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetCategoryImpl _$$BudgetCategoryImplFromJson(Map<String, dynamic> json) =>
    _$BudgetCategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      percentageAllocation: (json['percentageAllocation'] as num).toDouble(),
      colorHex: json['colorHex'] as String,
      iconName: json['iconName'] as String,
    );

Map<String, dynamic> _$$BudgetCategoryImplToJson(
        _$BudgetCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'percentageAllocation': instance.percentageAllocation,
      'colorHex': instance.colorHex,
      'iconName': instance.iconName,
    };
