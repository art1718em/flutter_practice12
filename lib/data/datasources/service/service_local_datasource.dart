import 'dart:convert';
import 'package:flutter_practice12/core/models/service_record_model.dart';
import 'package:flutter_practice12/core/storage/database_helper.dart';
import 'package:flutter_practice12/data/datasources/service/service_record_dto.dart';
import 'package:flutter_practice12/data/datasources/service/service_record_mapper.dart';
import 'package:uuid/uuid.dart';

class ServiceLocalDataSource {
  final _uuid = const Uuid();
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<List<ServiceRecordModel>> getServiceRecords() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'service_records',
      orderBy: 'date DESC',
    );

    return maps.map((map) {
      final mapWithList = Map<String, dynamic>.from(map);
      mapWithList['worksDone'] = jsonDecode(map['worksDone'] as String);
      return ServiceRecordDto.fromJson(mapWithList).toModel();
    }).toList();
  }

  Future<List<ServiceRecordModel>> getServiceRecordsByVehicle(String vehicleId) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'service_records',
      where: 'vehicleId = ?',
      whereArgs: [vehicleId],
      orderBy: 'date DESC',
    );

    return maps.map((map) {
      final mapWithList = Map<String, dynamic>.from(map);
      mapWithList['worksDone'] = jsonDecode(map['worksDone'] as String);
      return ServiceRecordDto.fromJson(mapWithList).toModel();
    }).toList();
  }

  Future<void> addServiceRecord(ServiceRecordModel record) async {
    final db = await _dbHelper.database;
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

    final json = newRecord.toDto().toJson();
    json['worksDone'] = jsonEncode(json['worksDone']);
    await db.insert('service_records', json);
  }

  Future<void> deleteServiceRecord(String id) async {
    final db = await _dbHelper.database;
    await db.delete(
      'service_records',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

