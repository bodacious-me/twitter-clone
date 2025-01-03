import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/features/auth/domain/entites/user.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_cubit.dart';

class HomePage extends StatefulWidget {
  AppUser? user;
   HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text('killed that motherfucker!!   ${widget.user!.email}'),
        leading: ElevatedButton(
            onPressed: () {
              final authCubit = context.read<AuthCubit>();
              authCubit.Logout();
            },
            child: Icon(Icons.logout)),
      ),
    );
  }
}
