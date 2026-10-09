import 'package:flutter/material.dart';
import 'package:sketch/core/api_service.dart';
import 'package:sketch/core/model/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream<List<UseModel>>? usersStream;

  @override
  void initState() {
    super.initState();
    usersStream = Stream.fromFuture(ApiService().fetchUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: StreamBuilder<List<UseModel>>(
        stream: usersStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            final users = snapshot.data!;

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];

                return ListTile(
                  title: Text(user.userId.toString()),
                  subtitle: Text(user.title.toString()),
                );
              },
            );
          }

          return const Center(child: Text('No users found'));
        },
      ),
    );
  }
}
