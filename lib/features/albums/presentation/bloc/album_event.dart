import 'package:equatable/equatable.dart';

sealed class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object?> get props => [];
}

final class AlbumsRequested extends AlbumEvent {
  const AlbumsRequested();
}
