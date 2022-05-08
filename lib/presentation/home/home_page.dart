import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/auth/auth_bloc.dart';
import '../../injection.dart';
import '../routes/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.mapOrNull(unauthenticated: (value) => getIt<AppRouter>().replaceNamed('/sign-in-page'),);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  getIt<AuthBloc>().add(const AuthEvent.signedOut());
                },
                icon: const Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}
