import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/features/auth/data/supabase_auth_repo.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_bloc.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_states.dart';
import 'package:twitterapp/features/auth/presentation/pages/home_page.dart';
import 'package:twitterapp/features/auth/presentation/pages/register_page.dart';
import 'package:twitterapp/themes/dark_mode.dart';

class MyApp extends StatelessWidget {
  final authRepo = SupabaseAuthRepo();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(authRepo: authRepo)),
      ],
      child: MaterialApp(
        key: ValueKey('MyAppKey'),
          theme: darkmode,
          debugShowCheckedModeBanner: false,
          home:
              BlocConsumer<AuthBloc, AuthStates>(builder: (context, authState) {
            print('State of the Application: ${authState}');
            if (authState is UnAuthenticated) {
              return const RegisterPage();
            } else if (authState is Authenticated) {
              return HomePage(user: authState.user);
              //return Text('HomePage');
            } else if(authState is AuthLoading){
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Container();
          }, listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          })),
    );
  }
}
