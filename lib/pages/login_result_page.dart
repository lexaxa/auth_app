import 'package:auth_app/auth/auth.dart';
import 'package:auth_app/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/bloc/auth_bloc.dart';
import '../repositories/models/user.dart';

class LoginResultPage extends StatelessWidget {
  const LoginResultPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginResultPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(
              builder: (context) {
                final User user =
                    context.select((AuthBloc bloc) => bloc.state.user);
                return user.username.isNotEmpty
                    ? Image.asset(
                        Assets.loginSuccess,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        Assets.loginFailure,
                        fit: BoxFit.cover,
                      );
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(const AuthLogout());
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
