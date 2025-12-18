import 'package:flutter_practice12/core/models/vehicle_model.dart';
import 'package:flutter_practice12/data/datasources/vehicles/vehicles_local_datasource.dart';
import 'package:flutter_practice12/domain/repositories/vehicles_repository.dart';

class VehiclesRepositoryImpl implements VehiclesRepository {
  final VehiclesLocalDataSource localDataSource;

  VehiclesRepositoryImpl(this.localDataSource);

  @override
  Future<List<VehicleModel>> getVehicles() {
    return localDataSource.getVehicles();
  }

  @override
  Future<VehicleModel> getVehicleById(String id) {
    return localDataSource.getVehicleById(id);
  }

  @override
  Future<void> addVehicle(VehicleModel vehicle) {
    return localDataSource.addVehicle(vehicle);
  }

  @override
  Future<void> updateVehicle(VehicleModel vehicle) {
    return localDataSource.updateVehicle(vehicle);
  }

  @override
  Future<void> deleteVehicle(String id) {
    return localDataSource.deleteVehicle(id);
  }

  @override
  Future<void> setActiveVehicle(String id) {
    return localDataSource.setActiveVehicle(id);
  }
}

