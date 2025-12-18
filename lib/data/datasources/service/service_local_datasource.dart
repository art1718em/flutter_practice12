import 'package:flutter_practice12/core/models/service_record_model.dart';
import 'package:flutter_practice12/data/datasources/service/service_record_dto.dart';
import 'package:flutter_practice12/data/datasources/service/service_record_mapper.dart';
import 'package:uuid/uuid.dart';

class ServiceLocalDataSource {
  final _uuid = const Uuid();
  final List<ServiceRecordDto> _records = [];

  Future<List<ServiceRecordModel>> getServiceRecords() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _records.map((dto) => dto.toModel()).toList();
  }

  Future<List<ServiceRecordModel>> getServiceRecordsByVehicle(String vehicleId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _records
        .where((dto) => dto.vehicleId == vehicleId)
        .map((dto) => dto.toModel())
        .toList();
  }

  Future<void> addServiceRecord(ServiceRecordModel record) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newRecord = ServiceRecordModel(
      id: _uuid.v4(),
      vehicleId: record.vehicleId,
      title: record.title,
      type: record.type,
      date: record.date,
      mileage: record.mileage,
      worksDone: record.worksDone,
      serviceCenter: record.serviceCenter,
      notes: record.notes,
      nextServiceDate: record.nextServiceDate,
    );
    _records.add(newRecord.toDto());
  }

  Future<void> deleteServiceRecord(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _records.removeWhere((dto) => dto.id == id);
  }
}

