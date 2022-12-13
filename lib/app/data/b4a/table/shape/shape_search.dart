import 'dart:developer';

import 'package:learning_about_b4a_flutter/app/core/models/shape_model.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/entity/shape_entity.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ShapeSearch {
  ShapeSearch() {
    log('=== ShapeSearch ===');
  }
  Future<List<String>> getObject(String objectId) async {
    log('+++ getObject +++');
    ShapeModel? shapeModel;
    final parseResponse =
        await ParseObject(ShapeEntity.className).getObject(objectId);

    if (parseResponse.success && parseResponse.results != null) {
      shapeModel = ShapeEntity().toModel(parseResponse.results!.first);
    }
    log('... getObject ...');
    if (shapeModel == null) {
      log('null');
      log('--- getObject ---');
      return [''];
    } else {
      log(shapeModel.toString());
      log('--- getObject ---');
      return [shapeModel.toString()];
    }
  }

  /// Retorna todos os objetos da class
  Future<List<String>> getAll() async {
    log('+++ getAll +++');
    var list = <ShapeModel>[];
    final parseResponse = await ParseObject(ShapeEntity.className).getAll();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(ShapeEntity().toModel(element));
      }
    }
    log('... getAll ...');

    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- getAll ---');
    return list.map((e) => e.toString()).toList();
  }
}
