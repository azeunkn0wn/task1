// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return Store(
    json['id'] as int,
    json['name_en'] as String? ?? '',
    json['name_bn'] as String? ?? '',
    json['slug'] as String? ?? '',
    json['url'] as String? ?? '',
    json['description_en'] as String? ?? '',
    json['description_bn'] as String? ?? '',
    json['logo'] as String? ?? '',
    (json['rating'] as num?)?.toDouble() ?? 0,
    json['max_cashback'] as String? ?? '',
    json['percent_now'] as String? ?? '',
    json['percent_old'] as String? ?? '',
    json['notified_in'] as String? ?? '',
    json['cashback_in'] as String? ?? '',
    json['is_active'] == null
        ? false
        : Store._boolFromInt(json['is_active'] as int),
    json['priority'] as int? ?? 0,
    json['is_top'] == null ? false : Store._boolFromInt(json['is_top'] as int),
    json['category_id'] as int? ?? 0,
    json['name'] as String? ?? '',
    json['description'] as String? ?? '',
  );
}

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'name_en': instance.name_en,
      'name_bn': instance.name_bn,
      'slug': instance.slug,
      'url': instance.url,
      'description_en': instance.description_en,
      'description_bn': instance.description_bn,
      'logo': instance.logo,
      'rating': instance.rating,
      'max_cashback': instance.max_cashback,
      'percent_now': instance.percent_now,
      'percent_old': instance.percent_old,
      'notified_in': instance.notified_in,
      'cashback_in': instance.cashback_in,
      'is_active': Store._boolToInt(instance.is_active),
      'priority': instance.priority,
      'is_top': Store._boolToInt(instance.is_top),
      'category_id': instance.category_id,
      'name': instance.name,
      'description': instance.description,
    };
