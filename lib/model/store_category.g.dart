// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreCategory _$StoreCategoryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return StoreCategory(
    json['id'] as int,
    name_en: json['name_en'] as String? ?? '',
    name_bn: json['name_bn'] as String? ?? '',
    slug: json['slug'] as String? ?? '',
    icon: json['icon'] as String? ?? '',
    color: json['color'] as String? ?? '',
    is_top: json['is_top'] == null
        ? false
        : StoreCategory._boolFromInt(json['is_top'] as int),
    is_active: json['is_active'] == null
        ? false
        : StoreCategory._boolFromInt(json['is_active'] as int),
    priority: json['priority'] as int? ?? 0,
    name: json['name'] as String? ?? '',
  );
}

Map<String, dynamic> _$StoreCategoryToJson(StoreCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.name_en,
      'name_bn': instance.name_bn,
      'slug': instance.slug,
      'icon': instance.icon,
      'color': instance.color,
      'is_top': StoreCategory._boolToInt(instance.is_top),
      'is_active': StoreCategory._boolToInt(instance.is_active),
      'priority': instance.priority,
      'name': instance.name,
    };
