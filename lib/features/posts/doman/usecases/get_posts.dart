import 'package:sketch/features/posts/doman/entities/posts.dart';
import 'package:sketch/features/posts/doman/repositories/posts_repository.dart';

class GetPosts {
  const GetPosts(this.repository);

  final PostsRepository repository;

  Future<List<Posts>> call() => repository.getPosts();
}
