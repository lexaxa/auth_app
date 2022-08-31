import 'package:auth_app/pages/login_page.dart';
import 'package:auth_app/pages/login_result_page.dart';
import 'package:auth_app/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthStatus.unknown:
              case AuthStatus.unauth:
                _navigator.pushAndRemoveUntil(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              case AuthStatus.auth:
              case AuthStatus.failure:
                _navigator.pushAndRemoveUntil(
                  LoginResultPage.route(),
                  (route) => false,
                );
                break;
              case AuthStatus.process:
              case AuthStatus.edit:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => LoginPage.route(),
    );
  }
}
