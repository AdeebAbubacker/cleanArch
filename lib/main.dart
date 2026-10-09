import 'package:flutter/material.dart';
import 'package:sketch/core/network/api_service.dart';
import 'package:sketch/features/posts/data/datasource/posts_remote_data_source.dart';
import 'package:sketch/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:sketch/features/posts/doman/repositories/posts_repository.dart';
import 'package:sketch/features/posts/doman/usecases/get_posts.dart';
import 'package:sketch/features/posts/presentation/posts/posts_bloc.dart';
import 'package:sketch/features/posts/presentation/screens/home_screen.dart';
import 'package:sketch/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final apiService = ApiService();
  final remoteDataSource = PostsRemoteDataSourceImpl(apiService);
  final repository = PostsRepositoryImpl(remoteDataSource);
  final getPosts = GetPosts(repository);
  runApp(MyApp(getPosts: getPosts));
}

class MyApp extends StatelessWidget {
  final GetPosts getPosts;
  const MyApp({super.key, required this.getPosts});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc(getPosts: getPosts),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
