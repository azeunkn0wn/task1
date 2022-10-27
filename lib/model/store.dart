// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'store.g.dart';

@JsonSerializable()
class Store {
  @JsonKey(required: true)
  final int id;
  @JsonKey(defaultValue: '')
  final String name_en;
  @JsonKey(defaultValue: '')
  final String name_bn;
  @JsonKey(defaultValue: '')
  final String slug;
  @JsonKey(defaultValue: '')
  final String url;
  @JsonKey(defaultValue: '')
  final String description_en;
  @JsonKey(defaultValue: '')
  final String description_bn;
  @JsonKey(defaultValue: '')
  final String logo;
  @JsonKey(defaultValue: 0)
  final double rating;
  @JsonKey(defaultValue: '')
  final String max_cashback;
  @JsonKey(defaultValue: '')
  final String percent_now;
  @JsonKey(defaultValue: '')
  final String percent_old;
  @JsonKey(defaultValue: '')
  final String notified_in;
  @JsonKey(defaultValue: '')
  final String cashback_in;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt, defaultValue: false)
  final bool is_active;
  @JsonKey(defaultValue: 0)
  final int priority;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt, defaultValue: false)
  final bool is_top;
  @JsonKey(defaultValue: 0)
  final int category_id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String description;

  Store(
      this.id,
      this.name_en,
      this.name_bn,
      this.slug,
      this.url,
      this.description_en,
      this.description_bn,
      this.logo,
      this.rating,
      this.max_cashback,
      this.percent_now,
      this.percent_old,
      this.notified_in,
      this.cashback_in,
      this.is_active,
      this.priority,
      this.is_top,
      this.category_id,
      this.name,
      this.description);
  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);

  static bool _boolFromInt(int done) => done == 1;

  static int _boolToInt(bool done) => done ? 1 : 0;
}
