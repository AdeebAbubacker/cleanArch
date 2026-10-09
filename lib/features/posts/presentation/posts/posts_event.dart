part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

final class GetpostRequests extends PostsEvent {
  const GetpostRequests();
}
