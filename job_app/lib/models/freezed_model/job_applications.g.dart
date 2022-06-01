// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_applications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobApplications _$$_JobApplicationsFromJson(Map<String, dynamic> json) =>
    _$_JobApplications(
      name: json['name'] as String,
      location: json['location'] as String,
      message: json['message'] as String,
      companyName: json['companyName'] as String,
      jobType: json['jobType'] as String,
      companyImgUrl: json['companyImgUrl'] as String,
      salary: json['salary'] as String,
    );

Map<String, dynamic> _$$_JobApplicationsToJson(_$_JobApplications instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'message': instance.message,
      'companyName': instance.companyName,
      'jobType': instance.jobType,
      'companyImgUrl': instance.companyImgUrl,
      'salary': instance.salary,
    };
