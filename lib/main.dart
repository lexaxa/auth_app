import 'package:auth_app/repositories/user_repository.dart';
import 'package:auth_app/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(MyApp(
    repository: UserRepository(service: AuthService()),
  ));
}
