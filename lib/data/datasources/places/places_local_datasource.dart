import 'package:flutter_practice12/core/models/favorite_place_model.dart';
import 'package:flutter_practice12/core/storage/database_helper.dart';
import 'package:flutter_practice12/data/datasources/places/favorite_place_dto.dart';
import 'package:flutter_practice12/data/datasources/places/favorite_place_mapper.dart';
import 'package:uuid/uuid.dart';

class PlacesLocalDataSource {
  final _uuid = const Uuid();
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<List<FavoritePlaceModel>> getPlaces() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'favorite_places',
      orderBy: 'name ASC',
    );

    return maps.map((map) => FavoritePlaceDto.fromJson(map).toModel()).toList();
  }

  Future<FavoritePlaceModel> getPlaceById(String id) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'favorite_places',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      throw Exception('Место с id $id не найдено');
    }

    return FavoritePlaceDto.fromJson(maps.first).toModel();
  }

  Future<void> addPlace(FavoritePlaceModel place) async {
    final db = await _dbHelper.database;
    final newPlace = FavoritePlaceModel(
      id: _uuid.v4(),
      name: place.name,
      type: place.type,
      address: place.address,
      phone: place.phone,
      rating: place.rating,
      notes: place.notes,
      lastVisit: place.lastVisit,
    );

    await db.insert(
      'favorite_places',
      newPlace.toDto().toJson(),
    );
  }

  Future<void> updatePlace(FavoritePlaceModel place) async {
    final db = await _dbHelper.database;
    final result = await db.update(
      'favorite_places',
      place.toDto().toJson(),
      where: 'id = ?',
      whereArgs: [place.id],
    );

    if (result == 0) {
      throw Exception('Место с id ${place.id} не найдено');
    }
  }

  Future<void> deletePlace(String id) async {
    final db = await _dbHelper.database;
    await db.delete(
      'favorite_places',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

