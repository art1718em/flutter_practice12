import 'package:flutter_practice12/core/models/app_settings_model.dart';
import 'package:flutter_practice12/data/datasources/settings/app_settings_dto.dart';
import 'package:flutter_practice12/data/datasources/settings/app_settings_mapper.dart';

class SettingsLocalDataSource {
  AppSettingsDto _settings = AppSettingsDto(
    themeMode: AppThemeMode.system.name,
    currency: Currency.rub.name,
    distanceUnit: DistanceUnit.kilometers.name,
    notificationsEnabled: true,
    autoBackup: false,
  );

  Future<AppSettingsModel> getSettings() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _settings.toModel();
  }

  Future<void> updateSettings(AppSettingsModel settings) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _settings = settings.toDto();
  }
}

