import 'dart:convert';

import '../../../../core/network/api_service.dart';
import '../models/album_model.dart';

abstract interface class AlbumRemoteDataSource {
  Future<List<AlbumModel>> fetchAlbums();
}

class AlbumRemoteDataSourceImpl implements AlbumRemoteDataSource {
  AlbumRemoteDataSourceImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<List<AlbumModel>> fetchAlbums() async {
    final response = await _apiService.get('/albums');
    if (response.statusCode != 200) {
      throw Exception('Could not load albums (HTTP ${response.statusCode}).');
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! List) throw const FormatException('Unexpected albums response.');
    return decoded
        .map((item) => AlbumModel.fromJson(item as Map<String, dynamic>))
        .toList(growable: false);
  }
}
