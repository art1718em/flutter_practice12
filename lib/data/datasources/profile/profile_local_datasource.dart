import 'package:flutter_practice12/core/models/user_profile_model.dart';
import 'package:flutter_practice12/data/datasources/profile/user_profile_dto.dart';
import 'package:flutter_practice12/data/datasources/profile/user_profile_mapper.dart';

class ProfileLocalDataSource {
  UserProfileDto? _profile;

  Future<UserProfileModel?> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _profile?.toModel();
  }

  Future<void> updateProfile(UserProfileModel profile) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _profile = profile.toDto();
  }
}

