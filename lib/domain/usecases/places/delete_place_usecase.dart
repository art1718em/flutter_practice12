import 'package:flutter_practice12/domain/repositories/places_repository.dart';

class DeletePlaceUseCase {
  final PlacesRepository repository;

  DeletePlaceUseCase(this.repository);

  Future<void> call(String id) {
    return repository.deletePlace(id);
  }
}

