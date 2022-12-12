class UserRepositoryException implements Exception {
  final String code;
  final String message;
  UserRepositoryException({
    required this.code,
    required this.message,
  });
}
