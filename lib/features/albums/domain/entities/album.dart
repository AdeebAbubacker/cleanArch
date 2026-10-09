import 'package:equatable/equatable.dart';

class Album extends Equatable {
  const Album({required this.userId, required this.id, required this.title});

  final int userId;
  final int id;
  final String title;

  @override
  List<Object?> get props => [userId, id, title];
}
