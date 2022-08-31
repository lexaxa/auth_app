part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  final AuthStatus status;
  final User user;

  const AuthState._({
    this.status = AuthStatus.unknown,
    this.user = const User(username: '', password: ''),
  });

  const AuthState.unknown() : this._();

  const AuthState.failure() : this._();

  const AuthState.auth(User user) : this._(status: AuthStatus.auth, user: user);

  const AuthState.unauth(User user) : this._(status: AuthStatus.unauth);

  const AuthState.process(User user) : this._(status: AuthStatus.process);

  @override
  List<Object?> get props => [status, user];

  AuthState copyWith({AuthStatus? status, User? user}) {
    return AuthState._(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}

enum AuthStatus { unknown, auth, unauth, failure, process, edit }
