import '../entities/album.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums();
}
