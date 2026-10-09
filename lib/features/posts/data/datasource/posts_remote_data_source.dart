import 'dart:convert';

import '../../../../core/network/api_service.dart';
import '../models/posts_model.dart';

abstract interface class PostsRemoteDataSource {
  Future<List<PostsModel>> fetchPosts();
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  PostsRemoteDataSourceImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<List<PostsModel>> fetchPosts() async {
    final response = await _apiService.get('/posts');
    if (response.statusCode != 200) {
      throw Exception('Could not load posts (HTTP ${response.statusCode}).');
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! List) {
      throw const FormatException('Unexpected posts response.');
    }
    return decoded
        .map((item) => PostsModel.fromJson(item as Map<String, dynamic>))
        .toList(growable: false);
  }
}
