import 'dart:developer';

import 'package:dotenv/dotenv.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ConnectB4A {
  String _appId = '1';
  String _clientKey = '1';

  getCredentials() {
    var env = DotEnv()..load();
    _appId = env['appId'] ?? _appId;
    _clientKey = env['clientKey'] ?? _clientKey;
  }

  Future<bool> initialize({bool debug = false}) async {
    getCredentials();
    String serverUrl = 'https://parseapi.back4app.com';
    await Parse().initialize(
      _appId,
      serverUrl,
      clientKey: _clientKey,
      debug: debug,
      // hideCompletAppIdAndClientKey: true,
    );
    return await healthCheck();
  }

  /// No healthCheck se o valor de appId ou clientKey estiver errado
  /// ele gera uma exceção.
  /// Mas ele nao deveria gerar uma exceção. Tinha que retornar um
  /// (await Parse().healthCheck()).success = false
  /// Então relatei isto nesta issue
  /// https://github.com/parse-community/Parse-SDK-Flutter/issues/799
  /// Pra resolver isto envolvi com um try...catch

  Future<bool> healthCheck() async {
    try {
      if ((await Parse().healthCheck()).success) {
        log('Back4app Connected.');
        return true;
      } else {
        log('Back4app NOT Connected.');
        log('Exit app.');
        return false;
      }
    } catch (e) {
      log('Parse().healthCheck() with erros.');
      log('Back4app NOT Connected.');
      log('Exit app.');
      return false;
    }
  }
}
