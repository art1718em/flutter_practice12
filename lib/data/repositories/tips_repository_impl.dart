import 'package:flutter_practice12/core/models/tip_model.dart';
import 'package:flutter_practice12/data/datasources/tips/tips_local_datasource.dart';
import 'package:flutter_practice12/domain/repositories/tips_repository.dart';

class TipsRepositoryImpl implements TipsRepository {
  final TipsLocalDataSource localDataSource;

  TipsRepositoryImpl(this.localDataSource);

  @override
  Future<List<TipModel>> getTips() {
    return localDataSource.getTips();
  }

  @override
  Future<TipModel> getTipById(String id) {
    return localDataSource.getTipById(id);
  }

  @override
  Future<void> toggleLike(String id) {
    return localDataSource.toggleLike(id);
  }
}

