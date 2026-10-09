import '../../domain/entities/album.dart';
import '../../domain/repositories/album_repository.dart';
import '../datasources/album_remote_data_source.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  const AlbumRepositoryImpl(this.remoteDataSource);

  final AlbumRemoteDataSource remoteDataSource;

  @override
  Future<List<Album>> getAlbums() => remoteDataSource.fetchAlbums();
}
