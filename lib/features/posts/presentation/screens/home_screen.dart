import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch/features/posts/presentation/posts/posts_bloc.dart';

class HomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Home Screen')),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state.status == PostsStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == PostsStatus.failure) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else if (state.status == PostsStatus.success) {
              final posts = state.albums;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  );
                },
              );
            }
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<PostsBloc>().add(GetpostRequests());
                  },
                  child: const Text('Fetch Posts'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
