import 'package:learning_about_b4a_flutter/app/core/models/user_model.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/entity/user_entity.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/profile/profile_repository_b4a.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/table/user/user_repository_exception.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/utils/parse_error_code.dart';
import 'package:learning_about_b4a_flutter/app/data/repositories/user_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserRepositoryB4a implements UserRepository {
  @override
  Future<UserModel?> readByEmail(String email) async {
    QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject(UserEntity.className));
    query.whereEqualTo('email', email);
    query.includeObject(['profile']);
    query.first();
    ParseResponse? parseResponse;
    try {
      parseResponse = await query.query();
      if (parseResponse.success && parseResponse.results != null) {
        return UserEntity().fromParse(parseResponse.results!.first);
      } else {
        throw Exception();
      }
    } catch (e) {
      var errorCodes = ParseErrorCode(parseResponse!.error!);
      throw UserRepositoryException(
        code: errorCodes.code,
        message: errorCodes.message,
      );
    }
  }

  @override
  Future<UserModel?> register(
      {required String email, required String password}) async {
    ParseResponse? parseResponse;

    try {
      final user = ParseUser.createUser(email, password, email);
      parseResponse = await user.signUp();
      if (parseResponse.success && parseResponse.results != null) {
        UserModel userModel =
            await UserEntity().fromParse(parseResponse.results!.first);
        return userModel;
      } else {
        throw Exception();
      }
    } catch (e) {
      var errorCodes = ParseErrorCode(parseResponse!.error!);
      throw UserRepositoryException(
        code: errorCodes.code,
        message: errorCodes.message,
      );
    }
  }

  @override
  Future<UserModel?> login(
      {required String email, required String password}) async {
    UserModel userModel;
    ParseResponse? parseResponse;
    try {
      final user = ParseUser(email, password, null);

      parseResponse = await user.login();
      if (parseResponse.success) {
        ParseUser parseUser = parseResponse.results!.first;
        var profileField = parseUser.get('profile');
        var profileRepositoryB4a = ProfileRepositoryB4a();

        userModel = UserModel(
          objectId: parseUser.objectId!,
          email: parseUser.emailAddress!,
          profile: await profileRepositoryB4a.readById(profileField.objectId),
        );
        return userModel;
      } else {
        throw Exception();
      }
    } catch (e) {
      var errorCodes = ParseErrorCode(parseResponse!.error!);
      throw UserRepositoryException(
        code: errorCodes.code,
        message: errorCodes.message,
      );
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    final ParseUser user = ParseUser(null, null, email);
    final ParseResponse parseResponse = await user.requestPasswordReset();
    if (!parseResponse.success) {
      var errorCodes = ParseErrorCode(parseResponse.error!);
      throw UserRepositoryException(
        code: errorCodes.code,
        message: errorCodes.message,
      );
    }
  }

  @override
  Future<bool> logout() async {
    final user = await ParseUser.currentUser() as ParseUser;
    var parseResponse = await user.logout();
    if (parseResponse.success) {
      return true;
    } else {
      return false;
    }
  }
}
