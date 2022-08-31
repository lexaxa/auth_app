class User {
  final String _username;
  final String _password;

  String get username => _username;
  String get password => _password;

  const User({required String username, required String password})
      : _username = username,
        _password = password;

  User.unknown()
      : _username = '',
        _password = '';
}
