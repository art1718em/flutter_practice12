import 'package:flutter_practice12/core/models/favorite_place_model.dart';
import 'package:flutter_practice12/domain/repositories/places_repository.dart';

class GetPlacesUseCase {
  final PlacesRepository repository;

  GetPlacesUseCase(this.repository);

  Future<List<FavoritePlaceModel>> call() {
    return repository.getPlaces();
  }
}

