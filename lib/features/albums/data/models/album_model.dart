import '../../domain/entities/album.dart';

class AlbumModel extends Album {
  const AlbumModel({required super.userId, required super.id, required super.title});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}
