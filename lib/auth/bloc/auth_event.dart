part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable{
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthEvent {
  final User _user;
  const AuthLogin(this._user);

  @override
  List<Object> get props => [_user];
}

class AuthLogout extends AuthEvent {
  const AuthLogout();
}

class AuthUsernameChanged extends AuthEvent {
  final String username;
  const AuthUsernameChanged(this.username);

  @override
  List<Object> get props => [username];
}

class AuthPasswordChanged extends AuthEvent {
  final String password;
  const AuthPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}
