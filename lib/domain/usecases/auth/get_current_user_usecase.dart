import 'package:flutter_practice12/core/models/user_model.dart';
import 'package:flutter_practice12/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<UserModel?> call() async {
    return await repository.getCurrentUser();
  }
}

