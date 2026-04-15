// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeDataModelImpl _$$HomeDataModelImplFromJson(Map<String, dynamic> json) =>
    _$HomeDataModelImpl(
      greeting: json['greeting'] as String,
      userName: json['userName'] as String,
      quickActions: (json['quickActions'] as List<dynamic>)
          .map((e) => QuickActionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      recentActivities: (json['recentActivities'] as List<dynamic>)
          .map((e) => RecentActivityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HomeDataModelImplToJson(_$HomeDataModelImpl instance) =>
    <String, dynamic>{
      'greeting': instance.greeting,
      'userName': instance.userName,
      'quickActions': instance.quickActions,
      'recentActivities': instance.recentActivities,
    };

_$QuickActionModelImpl _$$QuickActionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuickActionModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      icon: json['icon'] as String,
      route: json['route'] as String,
    );

Map<String, dynamic> _$$QuickActionModelImplToJson(
        _$QuickActionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon': instance.icon,
      'route': instance.route,
    };

_$RecentActivityModelImpl _$$RecentActivityModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecentActivityModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      timestamp: json['timestamp'] as String,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$RecentActivityModelImplToJson(
        _$RecentActivityModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'timestamp': instance.timestamp,
      'imageUrl': instance.imageUrl,
    };
