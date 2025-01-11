import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/features/auth/data/supabase_auth_repo.dart';
import 'package:twitterapp/features/auth/domain/entites/user.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_bloc.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_events.dart';

class HomePage extends StatefulWidget {
  final AppUser? user; // Make sure to use final for immutability
  
  HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${widget.user?.email ?? "Guest"}'), // Use the user property
        leading: ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(LogoutEvent());
          },
          child: const Icon(Icons.logout),
        ),
      ),
      body: Center(
        child: Text('Home Page Content'), // Add some content to the body
      ),
    );
  }
}
