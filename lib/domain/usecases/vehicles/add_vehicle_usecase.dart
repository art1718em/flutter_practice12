import 'package:flutter_practice12/core/models/vehicle_model.dart';
import 'package:flutter_practice12/domain/repositories/vehicles_repository.dart';

class AddVehicleUseCase {
  final VehiclesRepository repository;

  AddVehicleUseCase(this.repository);

  Future<void> call(VehicleModel vehicle) {
    return repository.addVehicle(vehicle);
  }
}

