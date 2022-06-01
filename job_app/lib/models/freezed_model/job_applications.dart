import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_applications.freezed.dart';
part 'job_applications.g.dart';

@Freezed()
class JobApplications with _$JobApplications {
  factory JobApplications({
    required String name,
    required String location,
    required String message,
    required String companyName,
    required String jobType,
    required String companyImgUrl,
    required String salary,
  }) = _JobApplications;

  factory JobApplications.fromJson(Map<String, dynamic> json)
  => _$JobApplicationsFromJson(json);

}