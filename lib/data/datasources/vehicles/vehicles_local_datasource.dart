import 'package:flutter_practice12/core/models/vehicle_model.dart';
import 'package:flutter_practice12/data/datasources/vehicles/vehicle_dto.dart';
import 'package:flutter_practice12/data/datasources/vehicles/vehicle_mapper.dart';
import 'package:uuid/uuid.dart';

class VehiclesLocalDataSource {
  final _uuid = const Uuid();
  final List<VehicleDto> _vehicles = [];

  Future<List<VehicleModel>> getVehicles() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _vehicles.map((dto) => dto.toModel()).toList();
  }

  Future<VehicleModel> getVehicleById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      final dto = _vehicles.firstWhere((v) => v.id == id);
      return dto.toModel();
    } catch (e) {
      throw Exception('Автомобиль с id $id не найден');
    }
  }

  Future<void> addVehicle(VehicleModel vehicle) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    for (int i = 0; i < _vehicles.length; i++) {
      _vehicles[i] = VehicleDto(
        id: _vehicles[i].id,
        brand: _vehicles[i].brand,
        model: _vehicles[i].model,
        year: _vehicles[i].year,
        vin: _vehicles[i].vin,
        licensePlate: _vehicles[i].licensePlate,
        color: _vehicles[i].color,
        mileage: _vehicles[i].mileage,
        purchaseDate: _vehicles[i].purchaseDate,
        isActive: false,
      );
    }

    final newVehicle = VehicleModel(
      id: _uuid.v4(),
      brand: vehicle.brand,
      model: vehicle.model,
      year: vehicle.year,
      vin: vehicle.vin,
      licensePlate: vehicle.licensePlate,
      color: vehicle.color,
      mileage: vehicle.mileage,
      purchaseDate: vehicle.purchaseDate,
      isActive: true,
    );

    _vehicles.add(newVehicle.toDto());
  }

  Future<void> updateVehicle(VehicleModel vehicle) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    try {
      final index = _vehicles.indexWhere((v) => v.id == vehicle.id);
      if (index >= 0) {
        _vehicles[index] = vehicle.toDto();
      } else {
        throw Exception('Автомобиль с id ${vehicle.id} не найден');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteVehicle(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _vehicles.removeWhere((v) => v.id == id);
  }

  Future<void> setActiveVehicle(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    for (int i = 0; i < _vehicles.length; i++) {
      _vehicles[i] = VehicleDto(
        id: _vehicles[i].id,
        brand: _vehicles[i].brand,
        model: _vehicles[i].model,
        year: _vehicles[i].year,
        vin: _vehicles[i].vin,
        licensePlate: _vehicles[i].licensePlate,
        color: _vehicles[i].color,
        mileage: _vehicles[i].mileage,
        purchaseDate: _vehicles[i].purchaseDate,
        isActive: _vehicles[i].id == id,
      );
    }
  }
}

