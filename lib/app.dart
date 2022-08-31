import 'package:auth_app/auth/auth.dart';
import 'package:auth_app/repositories/user_repository.dart';
import 'package:auth_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  const MyApp({Key? key, required UserRepository repository})
      : _userRepository = repository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _userRepository,
      child: BlocProvider(
        create: (context) =>
            AuthBloc(repository: context.read<UserRepository>()),
        child: const HomePage(),
      ),
    );
  }
}
