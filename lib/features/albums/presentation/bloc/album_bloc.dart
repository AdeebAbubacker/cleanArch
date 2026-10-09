import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_albums.dart';
import 'album_event.dart';
import 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final GetAlbums _getAlbums;
  AlbumBloc({required this._getAlbums}) : super(const AlbumState()) {
    on<AlbumsRequested>((event, emit) async {
      emit(const AlbumState(status: AlbumStatus.loading));
      try {
        final albums = await _getAlbums();
        emit(AlbumState(status: AlbumStatus.success, albums: albums));
      } catch (error) {
        emit(
          AlbumState(
            status: AlbumStatus.failure,
            errorMessage: error.toString().replaceFirst('Exception: ', ''),
          ),
        );
      }
    });
  }
}
