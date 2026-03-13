// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BudgetCategory _$BudgetCategoryFromJson(Map<String, dynamic> json) {
  return _BudgetCategory.fromJson(json);
}

/// @nodoc
mixin _$BudgetCategory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get percentageAllocation => throw _privateConstructorUsedError;
  String get colorHex => throw _privateConstructorUsedError;
  String get iconName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetCategoryCopyWith<BudgetCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetCategoryCopyWith<$Res> {
  factory $BudgetCategoryCopyWith(
          BudgetCategory value, $Res Function(BudgetCategory) then) =
      _$BudgetCategoryCopyWithImpl<$Res, BudgetCategory>;
  @useResult
  $Res call(
      {String id,
      String name,
      double percentageAllocation,
      String colorHex,
      String iconName});
}

/// @nodoc
class _$BudgetCategoryCopyWithImpl<$Res, $Val extends BudgetCategory>
    implements $BudgetCategoryCopyWith<$Res> {
  _$BudgetCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? percentageAllocation = null,
    Object? colorHex = null,
    Object? iconName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      percentageAllocation: null == percentageAllocation
          ? _value.percentageAllocation
          : percentageAllocation // ignore: cast_nullable_to_non_nullable
              as double,
      colorHex: null == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String,
      iconName: null == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetCategoryImplCopyWith<$Res>
    implements $BudgetCategoryCopyWith<$Res> {
  factory _$$BudgetCategoryImplCopyWith(_$BudgetCategoryImpl value,
          $Res Function(_$BudgetCategoryImpl) then) =
      __$$BudgetCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double percentageAllocation,
      String colorHex,
      String iconName});
}

/// @nodoc
class __$$BudgetCategoryImplCopyWithImpl<$Res>
    extends _$BudgetCategoryCopyWithImpl<$Res, _$BudgetCategoryImpl>
    implements _$$BudgetCategoryImplCopyWith<$Res> {
  __$$BudgetCategoryImplCopyWithImpl(
      _$BudgetCategoryImpl _value, $Res Function(_$BudgetCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? percentageAllocation = null,
    Object? colorHex = null,
    Object? iconName = null,
  }) {
    return _then(_$BudgetCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      percentageAllocation: null == percentageAllocation
          ? _value.percentageAllocation
          : percentageAllocation // ignore: cast_nullable_to_non_nullable
              as double,
      colorHex: null == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String,
      iconName: null == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetCategoryImpl implements _BudgetCategory {
  const _$BudgetCategoryImpl(
      {required this.id,
      required this.name,
      required this.percentageAllocation,
      required this.colorHex,
      required this.iconName});

  factory _$BudgetCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double percentageAllocation;
  @override
  final String colorHex;
  @override
  final String iconName;

  @override
  String toString() {
    return 'BudgetCategory(id: $id, name: $name, percentageAllocation: $percentageAllocation, colorHex: $colorHex, iconName: $iconName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.percentageAllocation, percentageAllocation) ||
                other.percentageAllocation == percentageAllocation) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, percentageAllocation, colorHex, iconName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetCategoryImplCopyWith<_$BudgetCategoryImpl> get copyWith =>
      __$$BudgetCategoryImplCopyWithImpl<_$BudgetCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetCategoryImplToJson(
      this,
    );
  }
}

abstract class _BudgetCategory implements BudgetCategory {
  const factory _BudgetCategory(
      {required final String id,
      required final String name,
      required final double percentageAllocation,
      required final String colorHex,
      required final String iconName}) = _$BudgetCategoryImpl;

  factory _BudgetCategory.fromJson(Map<String, dynamic> json) =
      _$BudgetCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get percentageAllocation;
  @override
  String get colorHex;
  @override
  String get iconName;
  @override
  @JsonKey(ignore: true)
  _$$BudgetCategoryImplCopyWith<_$BudgetCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
