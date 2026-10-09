import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/api_service.dart';
import 'features/albums/data/datasources/album_remote_data_source.dart';
import 'features/albums/data/repositories/album_repository_impl.dart';
import 'features/albums/domain/usecases/get_albums.dart';
import 'features/albums/presentation/bloc/album_bloc.dart';
import 'features/albums/presentation/bloc/album_event.dart';
import 'home_screen.dart';

void main() {
  final apiService = ApiService();
  final remoteDataSource = AlbumRemoteDataSourceImpl(apiService);
  final repository = AlbumRepositoryImpl(remoteDataSource);
  final getAlbums = GetAlbums(repository);

  runApp(MyApp(getAlbums: getAlbums));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.getAlbums, super.key});

  final GetAlbums getAlbums;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlbumBloc(getAlbums: getAlbums)..add(const AlbumsRequested()),
      child: MaterialApp(
        title: 'Albums',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const HomeScreen(),
      ),
    );
  }
}
