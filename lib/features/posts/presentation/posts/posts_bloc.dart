import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sketch/features/posts/doman/entities/posts.dart';
import 'package:sketch/features/posts/doman/usecases/get_posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPosts getPosts;
  PostsBloc({required this.getPosts}) : super(PostsState()) {
    on<GetpostRequests>((event, emit) async {
      emit(PostsState(status: PostsStatus.loading));
      try {
        final posts = await getPosts();
        emit(PostsState(status: PostsStatus.success, albums: posts));
      } catch (e) {
        emit(
          PostsState(status: PostsStatus.failure, errorMessage: e.toString()),
        );
      }
    });
  }
}
