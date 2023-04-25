import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_post.freezed.dart';
part 'user_post.g.dart';

@freezed
class UserPost with _$UserPost {
  const factory UserPost({
    String? id,
    String? title,
    String? body,
    String? userName,
  }) = _UserPost;

  factory UserPost.fromJson(Map<String, dynamic> json) => _$UserPostFromJson(json);
}
