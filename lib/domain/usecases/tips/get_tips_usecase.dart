import 'package:flutter_practice12/core/models/tip_model.dart';
import 'package:flutter_practice12/domain/repositories/tips_repository.dart';

class GetTipsUseCase {
  final TipsRepository repository;

  GetTipsUseCase(this.repository);

  Future<List<TipModel>> call() {
    return repository.getTips();
  }
}

