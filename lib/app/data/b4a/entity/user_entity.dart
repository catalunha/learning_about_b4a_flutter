import 'package:learning_about_b4a_flutter/app/core/models/user_model.dart';
import 'package:learning_about_b4a_flutter/app/data/b4a/entity/profile_entity.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserEntity {
  static const String className = '_User';

  Future<UserModel> fromParse(ParseObject parseUser) async {
    return UserModel(
      objectId: parseUser.objectId!,
      email: parseUser.get('username'),
      profile: parseUser.get('profile') != null
          ? ProfileEntity().fromParse(parseUser.get('profile'))
          : null,
    );
  }
}
