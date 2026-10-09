import 'package:sketch/features/posts/doman/entities/posts.dart';

abstract interface class PostsRepository {
  Future<List<Posts>> getPosts();
}
