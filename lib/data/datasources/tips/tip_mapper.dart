import 'package:flutter_practice12/core/models/tip_model.dart';
import 'package:flutter_practice12/data/datasources/tips/tip_dto.dart';

extension TipMapper on TipDto {
  TipModel toModel() {
    return TipModel(
      id: id,
      title: title,
      content: content,
      category: category,
      publishDate: DateTime.parse(publishDate),
      imageUrl: imageUrl,
      likes: likes,
      isLiked: isLiked,
    );
  }
}

