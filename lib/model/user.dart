// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(required: true)
  final int id;
  @JsonKey(defaultValue: 0.00)
  final double? portfolio_value;
  @JsonKey(defaultValue: '')
  final String? name;
  @JsonKey(defaultValue: '')
  final String? phone;
  @JsonKey(defaultValue: '')
  final String? email;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt, defaultValue: false)
  final bool? phone_confirmed;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt, defaultValue: false)
  final bool? is_active;
  @JsonKey(defaultValue: '')
  final String? gender;
  @JsonKey(defaultValue: '')
  final String? access_token;
  @JsonKey(defaultValue: '')
  final String? referred_by_code;
  @JsonKey(defaultValue: '')
  final String? referral_code;
  @JsonKey(defaultValue: '')
  final String? cashout_method;
  @JsonKey(defaultValue: '')
  final String? cashout_value;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User(
    this.id, {
    this.name,
    this.phone,
    this.email,
    this.phone_confirmed,
    this.is_active,
    this.gender,
    this.access_token,
    this.referred_by_code,
    this.referral_code,
    this.cashout_method,
    this.cashout_value,
    this.portfolio_value,
  });

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static bool _boolFromInt(int value) => value == 1;

  static int? _boolToInt(bool? value) => value == null ? null : (value ? 1 : 0);
}
