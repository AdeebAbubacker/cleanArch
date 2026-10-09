import 'package:sketch/features/posts/data/datasource/posts_remote_data_source.dart';
import 'package:sketch/features/posts/data/models/posts_model.dart';
import 'package:sketch/features/posts/doman/entities/posts.dart';
import 'package:sketch/features/posts/doman/repositories/posts_repository.dart';

class PostsRepositoryImpl implements PostsRepository {
  const PostsRepositoryImpl(this.remoteDataSource);

  final PostsRemoteDataSource remoteDataSource;

  @override
  Future<List<Posts>> getPosts() => remoteDataSource.fetchPosts();
}
