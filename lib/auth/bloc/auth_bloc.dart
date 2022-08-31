import 'dart:async';

import 'package:auth_app/repositories/models/user.dart';
import 'package:auth_app/repositories/user_repository.dart';
import 'package:auth_app/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _repository;

  AuthBloc({required UserRepository repository})
      : _repository = repository,
        super(const AuthState.unknown()) {
    on<AuthUsernameChanged>(_onAuthUsernameChanged);
    on<AuthPasswordChanged>(_onAuthPasswordChanged);
    on<AuthLogin>(_onAuthLogin);
    on<AuthLogout>(_onAuthLogout);
  }

  Future<void> _onAuthUsernameChanged(
      AuthUsernameChanged event, Emitter<AuthState> emitter) async {
    emitter(state.copyWith(
        status: AuthStatus.edit,
        user: User(username: event.username, password: state.user.password)));
  }

  Future<void> _onAuthPasswordChanged(
      AuthPasswordChanged event, Emitter<AuthState> emitter) async {
    emitter(state.copyWith(
        status: AuthStatus.edit,
        user: User(username: state.user.username, password: event.password)));
  }

  Future<void> _onAuthLogin(AuthLogin event, Emitter<AuthState> emitter) async {
    final user = state.user;
    try {
      emitter(AuthState.process(user));
      final result = await _repository.authorize(user.username, user.password);
      if (result == AuthResult.success) {
        emitter(AuthState.auth(user));
      } else {
        emitter(const AuthState.failure());
      }
    } catch (_) {
      emitter(const AuthState.failure());
    }
  }

  Future<void> _onAuthLogout(
      AuthLogout event, Emitter<AuthState> emitter) async {
    emitter(state.copyWith(
        status: AuthStatus.unauth,
        user: User.unknown()));
  }
}
