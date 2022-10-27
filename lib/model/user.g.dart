// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return User(
    json['id'] as int,
    name: json['name'] as String? ?? '',
    phone: json['phone'] as String? ?? '',
    email: json['email'] as String? ?? '',
    phone_confirmed: json['phone_confirmed'] == null
        ? false
        : User._boolFromInt(json['phone_confirmed'] as int),
    is_active: json['is_active'] == null
        ? false
        : User._boolFromInt(json['is_active'] as int),
    gender: json['gender'] as String? ?? '',
    access_token: json['access_token'] as String? ?? '',
    referred_by_code: json['referred_by_code'] as String? ?? '',
    referral_code: json['referral_code'] as String? ?? '',
    cashout_method: json['cashout_method'] as String? ?? '',
    cashout_value: json['cashout_value'] as String? ?? '',
    portfolio_value: (json['portfolio_value'] as num?)?.toDouble() ?? 0.0,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'portfolio_value': instance.portfolio_value,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'phone_confirmed': User._boolToInt(instance.phone_confirmed),
      'is_active': User._boolToInt(instance.is_active),
      'gender': instance.gender,
      'access_token': instance.access_token,
      'referred_by_code': instance.referred_by_code,
      'referral_code': instance.referral_code,
      'cashout_method': instance.cashout_method,
      'cashout_value': instance.cashout_value,
    };
