import 'dart:developer';

import 'package:learning_about_b4a_flutter/app/core/models/publisher_model.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/entity/publisher_entity.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class PublisherSearch {
  PublisherSearch() {
    log('=== PublisherView ===');
  }
  Future<List<String>> getObject(String objectId) async {
    log('+++ getObject +++');
    PublisherModel? genreModel;
    final parseResponse =
        await ParseObject(PublisherEntity.className).getObject(objectId);

    if (parseResponse.success && parseResponse.results != null) {
      genreModel = PublisherEntity().toModel(parseResponse.results!.first);
    }
    log('... getObject ...');
    if (genreModel == null) {
      log('null');
      log('--- getObject ---');
      return [''];
    } else {
      log(genreModel.toString());
      log('--- getObject ---');
      return [genreModel.toString()];
    }
  }

  /// Retorna todos os objetos da class
  Future<List<String>> getAll() async {
    log('+++ getAll +++');
    var list = <PublisherModel>[];
    final parseResponse = await ParseObject(PublisherEntity.className).getAll();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(PublisherEntity().toModel(element));
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
