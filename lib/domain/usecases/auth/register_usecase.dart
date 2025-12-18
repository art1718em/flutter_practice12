import 'package:flutter_practice12/core/models/user_model.dart';
import 'package:flutter_practice12/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<UserModel> call(String email, String password, String name) {
    return repository.register(email, password, name);
  }
}

