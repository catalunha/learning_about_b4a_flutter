import 'dart:convert';

class ProfileModel {
  final String? objectId;
  final String? email;
  final String? typeString;
  final String? typeFile;
  final bool? isActive;
  ProfileModel({
    this.objectId,
    this.email,
    this.typeString,
    this.typeFile,
    this.isActive,
  });

  ProfileModel copyWith({
    String? objectId,
    String? email,
    String? typeString,
    String? typeFile,
    bool? isActive,
  }) {
    return ProfileModel(
      objectId: objectId ?? this.objectId,
      email: email ?? this.email,
      typeString: typeString ?? this.typeString,
      typeFile: typeFile ?? this.typeFile,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (objectId != null) {
      result.addAll({'objectId': objectId});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (typeString != null) {
      result.addAll({'typeString': typeString});
    }
    if (typeFile != null) {
      result.addAll({'typeFile': typeFile});
    }
    if (isActive != null) {
      result.addAll({'isActive': isActive});
    }

    return result;
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      objectId: map['objectId'],
      email: map['email'],
      typeString: map['typeString'],
      typeFile: map['typeFile'],
      isActive: map['isActive'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileModel(objectId: $objectId, email: $email, typeString: $typeString, typeFile: $typeFile, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileModel &&
        other.objectId == objectId &&
        other.email == email &&
        other.typeString == typeString &&
        other.typeFile == typeFile &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return objectId.hashCode ^
        email.hashCode ^
        typeString.hashCode ^
        typeFile.hashCode ^
        isActive.hashCode;
  }
}
