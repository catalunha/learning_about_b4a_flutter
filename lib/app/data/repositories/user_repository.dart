import 'package:learning_about_b4a_flutter/app/core/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel?> register(
      {required String email, required String password});
  Future<UserModel?> login({required String email, required String password});
  Future<bool> logout();
  Future<void> forgotPassword(String email);
  Future<UserModel?> readByEmail(String email);
}
