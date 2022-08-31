import 'dart:math';

class AuthService {
  Future<AuthResult> authorize(String email, String password) async {
    final result = await Future.delayed(
      const Duration(seconds: 1),
      () => Random().nextBool() ? AuthResult.success : AuthResult.fail,
    );
    return result;
  }
}

enum AuthResult { success, fail, error }
