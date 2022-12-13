class AppErrorCode {
  int codeNumber;
  AppErrorCode(
    this.codeNumber,
  ) {
    decode();
  }
  String code = '';
  String message = '';
  decode() {
    code = 'App Error code: $codeNumber';
    message = _appCodes[codeNumber]!;
  }

  final Map<int, String> _appCodes = {
    0: 'Não consegui iniciar banco de dados.',
    1: 'Estamos analisando seu cadastro.',
  };
}
