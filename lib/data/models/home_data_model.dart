import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/home_data.dart';

part 'home_data_model.freezed.dart';
part 'home_data_model.g.dart';

/// Home data model
@freezed
class HomeDataModel with _$HomeDataModel {
  const factory HomeDataModel({
    required String greeting,
    required String userName,
    required List<QuickActionModel> quickActions,
    required List<RecentActivityModel> recentActivities,
  }) = _HomeDataModel;

  factory HomeDataModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDataModelFromJson(json);

  /// Convert to entity
  HomeData toEntity() {
    return HomeData(
      greeting: greeting,
      userName: userName,
      quickActions: quickActions.map((e) => e.toEntity()).toList(),
      recentActivities: recentActivities.map((e) => e.toEntity()).toList(),
    );
  }
}

/// Quick action model
@freezed
class QuickActionModel with _$QuickActionModel {
  const factory QuickActionModel({
    required String id,
    required String title,
    required String icon,
    required String route,
  }) = _QuickActionModel;

  factory QuickActionModel.fromJson(Map<String, dynamic> json) =>
      _$QuickActionModelFromJson(json);

  /// Convert to entity
  QuickAction toEntity() {
    return QuickAction(
      id: id,
      title: title,
      icon: icon,
      route: route,
    );
  }
}

/// Recent activity model
@freezed
class RecentActivityModel with _$RecentActivityModel {
  const factory RecentActivityModel({
    required String id,
    required String title,
    required String description,
    required String timestamp,
    String? imageUrl,
  }) = _RecentActivityModel;

  factory RecentActivityModel.fromJson(Map<String, dynamic> json) =>
      _$RecentActivityModelFromJson(json);

  /// Convert to entity
  RecentActivity toEntity() {
    return RecentActivity(
      id: id,
      title: title,
      description: description,
      timestamp: DateTime.parse(timestamp),
      imageUrl: imageUrl,
    );
  }
}
