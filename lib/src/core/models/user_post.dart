// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_post.freezed.dart';
part 'user_post.g.dart';

enum Status { idle, loading, error, success }

@freezed
class UserPost with _$UserPost {
  const factory UserPost({
    String? id,
    String? title,
    String? body,
    String? userName,
    @Default(Status.idle) @JsonKey(ignore: true) Status saveStatus,
  }) = _UserPost;

  factory UserPost.fromJson(Map<String, dynamic> json) => _$UserPostFromJson(json);
}
