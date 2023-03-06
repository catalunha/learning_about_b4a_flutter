import 'dart:developer';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ConnectB4A {
  String _appId = 'x4uHx8hJECtAPiKo4Z2f8IK9OUKRtcuUBBaUBHM9';
  String _clientKey = 'GoHjfXQ1fIClRQ6K9Gg9hc1dpKj90HJGRXcHeSrs';

  Future<void> getCredentials() async {
    // await dotenv.load(fileName: ".env");
    // _appId = dotenv.env['appId'] ?? _appId;
    // _clientKey = dotenv.env['clientKey'] ?? _clientKey;
    _appId = 'x4uHx8hJECtAPiKo4Z2f8IK9OUKRtcuUBBaUBHM9';
    _clientKey = 'GoHjfXQ1fIClRQ6K9Gg9hc1dpKj90HJGRXcHeSrs';
  }

  Future<bool> initialize({bool debug = false}) async {
    try {
      await getCredentials();
      String serverUrl = 'https://parseapi.back4app.com';
      await Parse().initialize(
        _appId,
        serverUrl,
        clientKey: _clientKey,
        debug: debug,
      );
      return await healthCheck();
    } catch (e) {
      return false;
    }
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
