class ProfileRepositoryException implements Exception {
  final String code;
  final String message;
  ProfileRepositoryException({
    required this.code,
    required this.message,
  });
}
