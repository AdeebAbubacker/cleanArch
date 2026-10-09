import 'package:equatable/equatable.dart';

import '../../domain/entities/album.dart';

enum AlbumStatus { initial, loading, success, failure }

final class AlbumState extends Equatable {
  const AlbumState({
    this.status = AlbumStatus.initial,
    this.albums = const [],
    this.errorMessage,
  });

  final AlbumStatus status;
  final List<Album> albums;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, albums, errorMessage];
}
