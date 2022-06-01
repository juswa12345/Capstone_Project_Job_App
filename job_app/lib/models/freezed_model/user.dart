import 'package:freezed_annotation/freezed_annotation.dart';
import 'job_applications.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class User with _$User{
  factory User({
    required String id,
    required String imgUrl,
    required String username,
    required String email,
    required String password,
    required String fullName,
    @Default([]) List<JobApplications> application,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json)
  => _$UserFromJson(json);
}