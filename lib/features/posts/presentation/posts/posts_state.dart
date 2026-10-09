part of 'posts_bloc.dart';

enum PostsStatus { initial, loading, success, failure }

final class PostsState extends Equatable {
  const PostsState({
    this.status = PostsStatus.initial,
    this.albums = const [],
    this.errorMessage,
  });

  final PostsStatus status;
  final List<Posts> albums;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, albums, errorMessage];
}
