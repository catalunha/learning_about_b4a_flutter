import 'package:learning_about_b4a_flutter/app/core/models/profile_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ProfileEntity {
  static const String className = 'Profile';

  ProfileModel fromParse(ParseObject parseObject) {
    ProfileModel profileModel = ProfileModel(
      objectId: parseObject.objectId!,
      email: parseObject.get('email'),
      typeString: parseObject.get('typeString'),
      typeFile: parseObject.get('typeFile')?.get('url'),
      isActive: parseObject.get('isActive'),
    );
    return profileModel;
  }

  Future<ParseObject> toParse(ProfileModel profileModel) async {
    final profileParseObject = ParseObject(ProfileEntity.className);
    if (profileModel.objectId != null) {
      profileParseObject.objectId = profileModel.objectId;
    }
    if (profileModel.typeString != null) {
      profileParseObject.set('typeString', profileModel.typeString);
    }
    // if (profileModel.isActive != null) {
    //   profileParseObject.set('isActive', profileModel.isActive);
    // }
    return profileParseObject;
  }
}
