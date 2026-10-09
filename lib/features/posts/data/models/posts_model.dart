import 'package:sketch/features/posts/doman/entities/posts.dart';

class PostsModel extends Posts {
  const PostsModel({
    required super.id,
    required super.title,
    required super.body,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
