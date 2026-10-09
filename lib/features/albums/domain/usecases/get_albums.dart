import '../entities/album.dart';
import '../repositories/album_repository.dart';

class GetAlbums {
  const GetAlbums(this.repository);

  final AlbumRepository repository;

  Future<List<Album>> call() => repository.getAlbums();
}
