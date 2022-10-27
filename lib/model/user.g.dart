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
    json['name'] as String?,
    json['phone'] as String?,
    json['email'] as String?,
    json['phone_confirmed'] == null
        ? false
        : User._boolFromInt(json['phone_confirmed'] as int),
    json['is_active'] == null
        ? false
        : User._boolFromInt(json['is_active'] as int),
    json['gender'] as String?,
    json['access_token'] as String?,
    json['referred_by_code'] as String?,
    json['referral_code'] as String?,
    json['cashout_method'] as String?,
    json['cashout_value'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
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
