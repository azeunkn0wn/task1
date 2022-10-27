// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'store_category.g.dart';

@JsonSerializable()
class StoreCategory {
  @JsonKey(required: true)
  final int id;
  @JsonKey(defaultValue: '')
  final String? name_en;
  @JsonKey(defaultValue: '')
  final String? name_bn;
  @JsonKey(defaultValue: '')
  final String? slug;
  @JsonKey(defaultValue: '')
  final String? icon;
  @JsonKey(defaultValue: '')
  final String? color;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt, defaultValue: false)
  final bool? is_top;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt, defaultValue: false)
  final bool? is_active;
  @JsonKey(defaultValue: 0)
  final int? priority;
  @JsonKey(defaultValue: '')
  final String? name;

  factory StoreCategory.fromJson(Map<String, dynamic> json) =>
      _$StoreCategoryFromJson(json);

  StoreCategory(
    this.id, {
    this.name_en,
    this.name_bn,
    this.slug,
    this.icon,
    this.color,
    this.is_top,
    this.is_active,
    this.priority,
    this.name,
  });

  Map<String, dynamic> toJson() => _$StoreCategoryToJson(this);

  static bool _boolFromInt(int value) => value == 1;

  static int? _boolToInt(bool? value) => value == null ? null : (value ? 1 : 0);
}
