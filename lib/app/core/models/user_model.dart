import 'dart:convert';

import 'package:learning_about_b4a_flutter/app/core/models/profile_model.dart';

class UserModel {
  final String objectId;
  final String email;
  ProfileModel? profile;
  UserModel({
    required this.objectId,
    required this.email,
    this.profile,
  });

  UserModel copyWith({
    String? objectId,
    String? email,
    ProfileModel? profile,
  }) {
    return UserModel(
      objectId: objectId ?? this.objectId,
      email: email ?? this.email,
      profile: profile ?? this.profile,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'objectId': objectId});
    result.addAll({'email': email});
    if (profile != null) {
      result.addAll({'profile': profile!.toMap()});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      objectId: map['objectId'] ?? '',
      email: map['email'] ?? '',
      profile:
          map['profile'] != null ? ProfileModel.fromMap(map['profile']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(objectId: $objectId, email: $email, profile: $profile)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.objectId == objectId &&
        other.email == email &&
        other.profile == profile;
  }

  @override
  int get hashCode => objectId.hashCode ^ email.hashCode ^ profile.hashCode;
}
