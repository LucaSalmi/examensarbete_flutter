// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPost _$UserPostFromJson(Map<String, dynamic> json) {
  return _UserPost.fromJson(json);
}

/// @nodoc
mixin _$UserPost {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPostCopyWith<UserPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostCopyWith<$Res> {
  factory $UserPostCopyWith(UserPost value, $Res Function(UserPost) then) =
      _$UserPostCopyWithImpl<$Res, UserPost>;
  @useResult
  $Res call({String? id, String? title, String? body, String? userName});
}

/// @nodoc
class _$UserPostCopyWithImpl<$Res, $Val extends UserPost>
    implements $UserPostCopyWith<$Res> {
  _$UserPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserPostCopyWith<$Res> implements $UserPostCopyWith<$Res> {
  factory _$$_UserPostCopyWith(
          _$_UserPost value, $Res Function(_$_UserPost) then) =
      __$$_UserPostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? title, String? body, String? userName});
}

/// @nodoc
class __$$_UserPostCopyWithImpl<$Res>
    extends _$UserPostCopyWithImpl<$Res, _$_UserPost>
    implements _$$_UserPostCopyWith<$Res> {
  __$$_UserPostCopyWithImpl(
      _$_UserPost _value, $Res Function(_$_UserPost) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? userName = freezed,
  }) {
    return _then(_$_UserPost(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserPost implements _UserPost {
  const _$_UserPost({this.id, this.title, this.body, this.userName});

  factory _$_UserPost.fromJson(Map<String, dynamic> json) =>
      _$$_UserPostFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final String? userName;

  @override
  String toString() {
    return 'UserPost(id: $id, title: $title, body: $body, userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPost &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, body, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPostCopyWith<_$_UserPost> get copyWith =>
      __$$_UserPostCopyWithImpl<_$_UserPost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserPostToJson(
      this,
    );
  }
}

abstract class _UserPost implements UserPost {
  const factory _UserPost(
      {final String? id,
      final String? title,
      final String? body,
      final String? userName}) = _$_UserPost;

  factory _UserPost.fromJson(Map<String, dynamic> json) = _$_UserPost.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get body;
  @override
  String? get userName;
  @override
  @JsonKey(ignore: true)
  _$$_UserPostCopyWith<_$_UserPost> get copyWith =>
      throw _privateConstructorUsedError;
}
