import 'package:flutter_practice12/core/models/vehicle_model.dart';

abstract class VehiclesRepository {
  Future<List<VehicleModel>> getVehicles();
  Future<VehicleModel> getVehicleById(String id);
  Future<void> addVehicle(VehicleModel vehicle);
  Future<void> updateVehicle(VehicleModel vehicle);
  Future<void> deleteVehicle(String id);
  Future<void> setActiveVehicle(String id);
}

