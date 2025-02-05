import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twitterapp/features/auth/data/supabase_auth_repo.dart';
import 'package:twitterapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twitterapp/features/auth/presentation/bloc/auth_states.dart';
import 'package:twitterapp/features/home/presentation/pages/home_page.dart';
import 'package:twitterapp/features/auth/presentation/pages/register_page.dart';
import 'package:twitterapp/features/post/data/supabase_post_repo.dart';
import 'package:twitterapp/features/post/domain/repositories/post_repo.dart';
import 'package:twitterapp/features/post/presentation/bloc/post_bloc.dart';
import 'package:twitterapp/themes/dark_mode.dart';

class MyApp extends StatelessWidget {
  final authRepo = SupabaseAuthRepo();
  final postRepo = SupabasePostRepo();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(authRepo: authRepo)),
        BlocProvider<PostBloc>(
            create: (conteext) =>
                PostBloc(postRepo: postRepo, authRepo: authRepo))
      ],
      child: MaterialApp(
          theme: darkmode,
          debugShowCheckedModeBanner: false,
          home: BlocListener<AuthBloc, AuthStates>(
            listener: (context, state) {
              print('state in the bloc listener: ${state}');
              if (state is UnAuthenticated) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              } else if (state is Authenticated) {
                print('homes user: ${state.user.email}');

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(user: state.user)));
              } else if (state is AuthError) {
                print(state.errorMessage);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Error Occurred: ${state.errorMessage}')));
              }
            },
            child: BlocBuilder<AuthBloc, AuthStates>(
              builder: (context, authState) {
                print('state in the bloc builder: ${authState}');
                if (authState is AuthLoading) {
                  return Center(
                      child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.secondary));
                } else if (authState is Authenticated) {
                  return HomePage(user: authState.user);
                } else {
                  return Container(); // Or your initial screen
                }
              },
            ),
          )),
    );
  }
}
