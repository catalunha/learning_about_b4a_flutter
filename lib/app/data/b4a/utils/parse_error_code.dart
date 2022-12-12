import 'dart:developer';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ParseErrorCode {
  final ParseError parseError;
  ParseErrorCode(
    this.parseError,
  ) {
    decode();
  }
  String code = '';
  String message = '';
  decode() {
    log('+++ +++ +++', name: 'ParseErrorCodes');
    log('${parseError.code} - ${parseError.message} - ${parseError.type}',
        name: 'ParseErrorCodes');
    log('--- --- ---', name: 'ParseErrorCodes');
    if (_appCodes.containsKey(parseError.code)) {
      code = 'Parse Erro: ${parseError.code}';
      message = _appCodes[parseError.code]!;
    } else {
      code = 'Parse Erro: ${parseError.code}';
      message = parseError.message;
    }
  }

  final Map<int, String> _appCodes = {
    //1 - Successful request, but no results found - No Results
    //101 - Invalid username/password. - ObjectNotFound
    101: 'Email ou senha inválidos ou não cadastrados.',
    202: 'Já existe uma conta para este email.',
    205: 'Veja seu email para validar seu cadastro.',
    // 209 - Invalid session token - InvalidSessionToken
    //  111 - schema mismatch for Evolution.event; expected Pointer<Event> but got String - IncorrectType
  };
}
