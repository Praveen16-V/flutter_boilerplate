// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeDataModel _$HomeDataModelFromJson(Map<String, dynamic> json) {
  return _HomeDataModel.fromJson(json);
}

/// @nodoc
mixin _$HomeDataModel {
  String get greeting => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  List<QuickActionModel> get quickActions => throw _privateConstructorUsedError;
  List<RecentActivityModel> get recentActivities =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeDataModelCopyWith<HomeDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeDataModelCopyWith<$Res> {
  factory $HomeDataModelCopyWith(
          HomeDataModel value, $Res Function(HomeDataModel) then) =
      _$HomeDataModelCopyWithImpl<$Res, HomeDataModel>;
  @useResult
  $Res call(
      {String greeting,
      String userName,
      List<QuickActionModel> quickActions,
      List<RecentActivityModel> recentActivities});
}

/// @nodoc
class _$HomeDataModelCopyWithImpl<$Res, $Val extends HomeDataModel>
    implements $HomeDataModelCopyWith<$Res> {
  _$HomeDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? greeting = null,
    Object? userName = null,
    Object? quickActions = null,
    Object? recentActivities = null,
  }) {
    return _then(_value.copyWith(
      greeting: null == greeting
          ? _value.greeting
          : greeting // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      quickActions: null == quickActions
          ? _value.quickActions
          : quickActions // ignore: cast_nullable_to_non_nullable
              as List<QuickActionModel>,
      recentActivities: null == recentActivities
          ? _value.recentActivities
          : recentActivities // ignore: cast_nullable_to_non_nullable
              as List<RecentActivityModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeDataModelImplCopyWith<$Res>
    implements $HomeDataModelCopyWith<$Res> {
  factory _$$HomeDataModelImplCopyWith(
          _$HomeDataModelImpl value, $Res Function(_$HomeDataModelImpl) then) =
      __$$HomeDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String greeting,
      String userName,
      List<QuickActionModel> quickActions,
      List<RecentActivityModel> recentActivities});
}

/// @nodoc
class __$$HomeDataModelImplCopyWithImpl<$Res>
    extends _$HomeDataModelCopyWithImpl<$Res, _$HomeDataModelImpl>
    implements _$$HomeDataModelImplCopyWith<$Res> {
  __$$HomeDataModelImplCopyWithImpl(
      _$HomeDataModelImpl _value, $Res Function(_$HomeDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? greeting = null,
    Object? userName = null,
    Object? quickActions = null,
    Object? recentActivities = null,
  }) {
    return _then(_$HomeDataModelImpl(
      greeting: null == greeting
          ? _value.greeting
          : greeting // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      quickActions: null == quickActions
          ? _value._quickActions
          : quickActions // ignore: cast_nullable_to_non_nullable
              as List<QuickActionModel>,
      recentActivities: null == recentActivities
          ? _value._recentActivities
          : recentActivities // ignore: cast_nullable_to_non_nullable
              as List<RecentActivityModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeDataModelImpl implements _HomeDataModel {
  const _$HomeDataModelImpl(
      {required this.greeting,
      required this.userName,
      required final List<QuickActionModel> quickActions,
      required final List<RecentActivityModel> recentActivities})
      : _quickActions = quickActions,
        _recentActivities = recentActivities;

  factory _$HomeDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeDataModelImplFromJson(json);

  @override
  final String greeting;
  @override
  final String userName;
  final List<QuickActionModel> _quickActions;
  @override
  List<QuickActionModel> get quickActions {
    if (_quickActions is EqualUnmodifiableListView) return _quickActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quickActions);
  }

  final List<RecentActivityModel> _recentActivities;
  @override
  List<RecentActivityModel> get recentActivities {
    if (_recentActivities is EqualUnmodifiableListView)
      return _recentActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentActivities);
  }

  @override
  String toString() {
    return 'HomeDataModel(greeting: $greeting, userName: $userName, quickActions: $quickActions, recentActivities: $recentActivities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeDataModelImpl &&
            (identical(other.greeting, greeting) ||
                other.greeting == greeting) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            const DeepCollectionEquality()
                .equals(other._quickActions, _quickActions) &&
            const DeepCollectionEquality()
                .equals(other._recentActivities, _recentActivities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      greeting,
      userName,
      const DeepCollectionEquality().hash(_quickActions),
      const DeepCollectionEquality().hash(_recentActivities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeDataModelImplCopyWith<_$HomeDataModelImpl> get copyWith =>
      __$$HomeDataModelImplCopyWithImpl<_$HomeDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeDataModelImplToJson(
      this,
    );
  }
}

abstract class _HomeDataModel implements HomeDataModel {
  const factory _HomeDataModel(
          {required final String greeting,
          required final String userName,
          required final List<QuickActionModel> quickActions,
          required final List<RecentActivityModel> recentActivities}) =
      _$HomeDataModelImpl;

  factory _HomeDataModel.fromJson(Map<String, dynamic> json) =
      _$HomeDataModelImpl.fromJson;

  @override
  String get greeting;
  @override
  String get userName;
  @override
  List<QuickActionModel> get quickActions;
  @override
  List<RecentActivityModel> get recentActivities;
  @override
  @JsonKey(ignore: true)
  _$$HomeDataModelImplCopyWith<_$HomeDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuickActionModel _$QuickActionModelFromJson(Map<String, dynamic> json) {
  return _QuickActionModel.fromJson(json);
}

/// @nodoc
mixin _$QuickActionModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get route => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuickActionModelCopyWith<QuickActionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickActionModelCopyWith<$Res> {
  factory $QuickActionModelCopyWith(
          QuickActionModel value, $Res Function(QuickActionModel) then) =
      _$QuickActionModelCopyWithImpl<$Res, QuickActionModel>;
  @useResult
  $Res call({String id, String title, String icon, String route});
}

/// @nodoc
class _$QuickActionModelCopyWithImpl<$Res, $Val extends QuickActionModel>
    implements $QuickActionModelCopyWith<$Res> {
  _$QuickActionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? icon = null,
    Object? route = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuickActionModelImplCopyWith<$Res>
    implements $QuickActionModelCopyWith<$Res> {
  factory _$$QuickActionModelImplCopyWith(_$QuickActionModelImpl value,
          $Res Function(_$QuickActionModelImpl) then) =
      __$$QuickActionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String icon, String route});
}

/// @nodoc
class __$$QuickActionModelImplCopyWithImpl<$Res>
    extends _$QuickActionModelCopyWithImpl<$Res, _$QuickActionModelImpl>
    implements _$$QuickActionModelImplCopyWith<$Res> {
  __$$QuickActionModelImplCopyWithImpl(_$QuickActionModelImpl _value,
      $Res Function(_$QuickActionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? icon = null,
    Object? route = null,
  }) {
    return _then(_$QuickActionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuickActionModelImpl implements _QuickActionModel {
  const _$QuickActionModelImpl(
      {required this.id,
      required this.title,
      required this.icon,
      required this.route});

  factory _$QuickActionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuickActionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String icon;
  @override
  final String route;

  @override
  String toString() {
    return 'QuickActionModel(id: $id, title: $title, icon: $icon, route: $route)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickActionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.route, route) || other.route == route));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, icon, route);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuickActionModelImplCopyWith<_$QuickActionModelImpl> get copyWith =>
      __$$QuickActionModelImplCopyWithImpl<_$QuickActionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuickActionModelImplToJson(
      this,
    );
  }
}

abstract class _QuickActionModel implements QuickActionModel {
  const factory _QuickActionModel(
      {required final String id,
      required final String title,
      required final String icon,
      required final String route}) = _$QuickActionModelImpl;

  factory _QuickActionModel.fromJson(Map<String, dynamic> json) =
      _$QuickActionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get icon;
  @override
  String get route;
  @override
  @JsonKey(ignore: true)
  _$$QuickActionModelImplCopyWith<_$QuickActionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentActivityModel _$RecentActivityModelFromJson(Map<String, dynamic> json) {
  return _RecentActivityModel.fromJson(json);
}

/// @nodoc
mixin _$RecentActivityModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentActivityModelCopyWith<RecentActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentActivityModelCopyWith<$Res> {
  factory $RecentActivityModelCopyWith(
          RecentActivityModel value, $Res Function(RecentActivityModel) then) =
      _$RecentActivityModelCopyWithImpl<$Res, RecentActivityModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String timestamp,
      String? imageUrl});
}

/// @nodoc
class _$RecentActivityModelCopyWithImpl<$Res, $Val extends RecentActivityModel>
    implements $RecentActivityModelCopyWith<$Res> {
  _$RecentActivityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? timestamp = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentActivityModelImplCopyWith<$Res>
    implements $RecentActivityModelCopyWith<$Res> {
  factory _$$RecentActivityModelImplCopyWith(_$RecentActivityModelImpl value,
          $Res Function(_$RecentActivityModelImpl) then) =
      __$$RecentActivityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String timestamp,
      String? imageUrl});
}

/// @nodoc
class __$$RecentActivityModelImplCopyWithImpl<$Res>
    extends _$RecentActivityModelCopyWithImpl<$Res, _$RecentActivityModelImpl>
    implements _$$RecentActivityModelImplCopyWith<$Res> {
  __$$RecentActivityModelImplCopyWithImpl(_$RecentActivityModelImpl _value,
      $Res Function(_$RecentActivityModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? timestamp = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$RecentActivityModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentActivityModelImpl implements _RecentActivityModel {
  const _$RecentActivityModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.timestamp,
      this.imageUrl});

  factory _$RecentActivityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentActivityModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String timestamp;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'RecentActivityModel(id: $id, title: $title, description: $description, timestamp: $timestamp, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentActivityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, timestamp, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentActivityModelImplCopyWith<_$RecentActivityModelImpl> get copyWith =>
      __$$RecentActivityModelImplCopyWithImpl<_$RecentActivityModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentActivityModelImplToJson(
      this,
    );
  }
}

abstract class _RecentActivityModel implements RecentActivityModel {
  const factory _RecentActivityModel(
      {required final String id,
      required final String title,
      required final String description,
      required final String timestamp,
      final String? imageUrl}) = _$RecentActivityModelImpl;

  factory _RecentActivityModel.fromJson(Map<String, dynamic> json) =
      _$RecentActivityModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get timestamp;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$RecentActivityModelImplCopyWith<_$RecentActivityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
