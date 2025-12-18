import 'package:flutter_practice12/core/models/tip_model.dart';

abstract class TipsRepository {
  Future<List<TipModel>> getTips();
  Future<TipModel> getTipById(String id);
  Future<void> toggleLike(String id);
}

