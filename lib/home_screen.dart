import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/albums/presentation/bloc/album_bloc.dart';
import 'features/albums/presentation/bloc/album_event.dart';
import 'features/albums/presentation/bloc/album_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Albums')),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          switch (state.status) {
            case AlbumStatus.initial:
            case AlbumStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case AlbumStatus.failure:
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.errorMessage ?? 'Could not load albums.'),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      onPressed: () => context.read<AlbumBloc>().add(const AlbumsRequested()),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Try again'),
                    ),
                  ],
                ),
              );
            case AlbumStatus.success:
              if (state.albums.isEmpty) return const Center(child: Text('No albums found.'));
              return ListView.separated(
                itemCount: state.albums.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final album = state.albums[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${album.id}')),
                    title: Text(album.title),
                    subtitle: Text('User ${album.userId}'),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
