// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      imgUrl: json['imgUrl'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
      application: (json['application'] as List<dynamic>?)
              ?.map((e) => JobApplications.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'imgUrl': instance.imgUrl,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'fullName': instance.fullName,
      'application': instance.application,
    };
