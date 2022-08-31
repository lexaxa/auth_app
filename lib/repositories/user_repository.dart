
import 'dart:math';

import '../services/auth_service.dart';

class UserRepository {
  final AuthService _service;

  const UserRepository({required AuthService service}): _service = service;

  Future<AuthResult> authorize(String username, String password) async {
    final result = await Future.delayed(
      const Duration(seconds: 1),
          () => Random().nextBool() ? AuthResult.success : AuthResult.fail,
    );
    return result;
  }
}
