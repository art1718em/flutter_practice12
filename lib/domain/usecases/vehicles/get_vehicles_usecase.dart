import 'package:flutter_practice12/core/models/vehicle_model.dart';
import 'package:flutter_practice12/domain/repositories/vehicles_repository.dart';

class GetVehiclesUseCase {
  final VehiclesRepository repository;

  GetVehiclesUseCase(this.repository);

  Future<List<VehicleModel>> call() {
    return repository.getVehicles();
  }
}

