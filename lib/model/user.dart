// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(required: true)
  final int id;
  final String? name;
  final String? phone;
  final String? email;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt, defaultValue: false)
  final bool phone_confirmed;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt, defaultValue: false)
  final bool is_active;
  final String? gender;
  final String? access_token;
  final String? referred_by_code;
  final String? referral_code;
  final String? cashout_method;
  final String? cashout_value;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User(
      this.id,
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
      this.cashout_value);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static bool _boolFromInt(int done) => done == 1;

  static int _boolToInt(bool done) => done ? 1 : 0;
}
