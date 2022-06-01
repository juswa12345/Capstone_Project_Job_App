// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'job_applications.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobApplications _$JobApplicationsFromJson(Map<String, dynamic> json) {
  return _JobApplications.fromJson(json);
}

/// @nodoc
mixin _$JobApplications {
  String get name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get jobType => throw _privateConstructorUsedError;
  String get companyImgUrl => throw _privateConstructorUsedError;
  String get salary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobApplicationsCopyWith<JobApplications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobApplicationsCopyWith<$Res> {
  factory $JobApplicationsCopyWith(
          JobApplications value, $Res Function(JobApplications) then) =
      _$JobApplicationsCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String location,
      String message,
      String companyName,
      String jobType,
      String companyImgUrl,
      String salary});
}

/// @nodoc
class _$JobApplicationsCopyWithImpl<$Res>
    implements $JobApplicationsCopyWith<$Res> {
  _$JobApplicationsCopyWithImpl(this._value, this._then);

  final JobApplications _value;
  // ignore: unused_field
  final $Res Function(JobApplications) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? location = freezed,
    Object? message = freezed,
    Object? companyName = freezed,
    Object? jobType = freezed,
    Object? companyImgUrl = freezed,
    Object? salary = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      jobType: jobType == freezed
          ? _value.jobType
          : jobType // ignore: cast_nullable_to_non_nullable
              as String,
      companyImgUrl: companyImgUrl == freezed
          ? _value.companyImgUrl
          : companyImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      salary: salary == freezed
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_JobApplicationsCopyWith<$Res>
    implements $JobApplicationsCopyWith<$Res> {
  factory _$$_JobApplicationsCopyWith(
          _$_JobApplications value, $Res Function(_$_JobApplications) then) =
      __$$_JobApplicationsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String location,
      String message,
      String companyName,
      String jobType,
      String companyImgUrl,
      String salary});
}

/// @nodoc
class __$$_JobApplicationsCopyWithImpl<$Res>
    extends _$JobApplicationsCopyWithImpl<$Res>
    implements _$$_JobApplicationsCopyWith<$Res> {
  __$$_JobApplicationsCopyWithImpl(
      _$_JobApplications _value, $Res Function(_$_JobApplications) _then)
      : super(_value, (v) => _then(v as _$_JobApplications));

  @override
  _$_JobApplications get _value => super._value as _$_JobApplications;

  @override
  $Res call({
    Object? name = freezed,
    Object? location = freezed,
    Object? message = freezed,
    Object? companyName = freezed,
    Object? jobType = freezed,
    Object? companyImgUrl = freezed,
    Object? salary = freezed,
  }) {
    return _then(_$_JobApplications(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      jobType: jobType == freezed
          ? _value.jobType
          : jobType // ignore: cast_nullable_to_non_nullable
              as String,
      companyImgUrl: companyImgUrl == freezed
          ? _value.companyImgUrl
          : companyImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      salary: salary == freezed
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JobApplications implements _JobApplications {
  _$_JobApplications(
      {required this.name,
      required this.location,
      required this.message,
      required this.companyName,
      required this.jobType,
      required this.companyImgUrl,
      required this.salary});

  factory _$_JobApplications.fromJson(Map<String, dynamic> json) =>
      _$$_JobApplicationsFromJson(json);

  @override
  final String name;
  @override
  final String location;
  @override
  final String message;
  @override
  final String companyName;
  @override
  final String jobType;
  @override
  final String companyImgUrl;
  @override
  final String salary;

  @override
  String toString() {
    return 'JobApplications(name: $name, location: $location, message: $message, companyName: $companyName, jobType: $jobType, companyImgUrl: $companyImgUrl, salary: $salary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobApplications &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.companyName, companyName) &&
            const DeepCollectionEquality().equals(other.jobType, jobType) &&
            const DeepCollectionEquality()
                .equals(other.companyImgUrl, companyImgUrl) &&
            const DeepCollectionEquality().equals(other.salary, salary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(companyName),
      const DeepCollectionEquality().hash(jobType),
      const DeepCollectionEquality().hash(companyImgUrl),
      const DeepCollectionEquality().hash(salary));

  @JsonKey(ignore: true)
  @override
  _$$_JobApplicationsCopyWith<_$_JobApplications> get copyWith =>
      __$$_JobApplicationsCopyWithImpl<_$_JobApplications>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JobApplicationsToJson(this);
  }
}

abstract class _JobApplications implements JobApplications {
  factory _JobApplications(
      {required final String name,
      required final String location,
      required final String message,
      required final String companyName,
      required final String jobType,
      required final String companyImgUrl,
      required final String salary}) = _$_JobApplications;

  factory _JobApplications.fromJson(Map<String, dynamic> json) =
      _$_JobApplications.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get location => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String get companyName => throw _privateConstructorUsedError;
  @override
  String get jobType => throw _privateConstructorUsedError;
  @override
  String get companyImgUrl => throw _privateConstructorUsedError;
  @override
  String get salary => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_JobApplicationsCopyWith<_$_JobApplications> get copyWith =>
      throw _privateConstructorUsedError;
}
