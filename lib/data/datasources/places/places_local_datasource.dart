import 'package:flutter_practice12/core/models/favorite_place_model.dart';
import 'package:flutter_practice12/data/datasources/places/favorite_place_dto.dart';
import 'package:flutter_practice12/data/datasources/places/favorite_place_mapper.dart';
import 'package:uuid/uuid.dart';

class PlacesLocalDataSource {
  final _uuid = const Uuid();
  final List<FavoritePlaceDto> _places = [];

  Future<List<FavoritePlaceModel>> getPlaces() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _places.map((dto) => dto.toModel()).toList();
  }

  Future<FavoritePlaceModel> getPlaceById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      final dto = _places.firstWhere((p) => p.id == id);
      return dto.toModel();
    } catch (e) {
      throw Exception('Место с id $id не найдено');
    }
  }

  Future<void> addPlace(FavoritePlaceModel place) async {
    await Future.delayed(const Duration(milliseconds: 300));
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
    _places.add(newPlace.toDto());
  }

  Future<void> updatePlace(FavoritePlaceModel place) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      final index = _places.indexWhere((p) => p.id == place.id);
      if (index >= 0) {
        _places[index] = place.toDto();
      } else {
        throw Exception('Место с id ${place.id} не найдено');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletePlace(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _places.removeWhere((p) => p.id == id);
  }
}

