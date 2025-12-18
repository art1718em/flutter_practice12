import 'package:flutter_practice12/core/models/user_model.dart';
import 'package:flutter_practice12/data/datasources/auth/auth_local_datasource.dart';
import 'package:flutter_practice12/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.localDataSource);

  @override
  Future<UserModel?> login(String email, String password) {
    return localDataSource.login(email, password);
  }

  @override
  Future<UserModel> register(String email, String password, String name) {
    return localDataSource.register(email, password, name);
  }

  @override
  Future<void> logout() {
    return localDataSource.logout();
  }

  @override
  Future<UserModel?> getCurrentUser() {
    return localDataSource.getCurrentUser();
  }
}

