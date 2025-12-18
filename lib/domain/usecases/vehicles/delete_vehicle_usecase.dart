import 'package:flutter_practice12/domain/repositories/vehicles_repository.dart';

class DeleteVehicleUseCase {
  final VehiclesRepository repository;

  DeleteVehicleUseCase(this.repository);

  Future<void> call(String id) {
    return repository.deleteVehicle(id);
  }
}

