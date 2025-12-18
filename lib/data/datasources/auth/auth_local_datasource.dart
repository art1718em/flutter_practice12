import 'package:flutter_practice12/core/models/user_model.dart';
import 'package:flutter_practice12/data/datasources/auth/user_dto.dart';
import 'package:flutter_practice12/data/datasources/auth/user_mapper.dart';
import 'package:uuid/uuid.dart';

class AuthLocalDataSource {
  final _uuid = const Uuid();
  final Map<String, UserDto> _users = {};
  UserDto? _currentUser;

  Future<UserModel?> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (!_users.containsKey(email)) {
      throw Exception('Пользователь не найден');
    }

    if (_users[email]!.password != password) {
      throw Exception('Неверный пароль');
    }

    _currentUser = _users[email];
    return _currentUser!.toModel();
  }

  Future<UserModel> register(String email, String password, String name) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (_users.containsKey(email)) {
      throw Exception('Пользователь с таким email уже существует');
    }

    final userDto = UserDto(
      id: _uuid.v4(),
      email: email,
      password: password,
      name: name,
      registrationDate: DateTime.now().toIso8601String(),
    );

    _users[email] = userDto;
    _currentUser = userDto;
    return userDto.toModel();
  }

  Future<void> logout() async {
    _currentUser = null;
  }

  UserModel? getCurrentUser() {
    return _currentUser?.toModel();
  }
}

