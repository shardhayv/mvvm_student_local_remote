import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/course_entity.dart';

part 'course_api_model.g.dart';

final courseApiModelProvider = Provider(
  (ref) => CourseApiModel.empty(),
);

@JsonSerializable()
class CourseApiModel {
  @JsonKey(name: '_id')
  final String? courseId;
  final String courseName;

  CourseApiModel({
    required this.courseId,
    required this.courseName,
  });

  CourseApiModel.empty()
      : this(
          courseId: '',
          courseName: '',
        );

  // Convert API Object to Entity
  CourseEntity toEntity() => CourseEntity(
        courseId: courseId,
        courseName: courseName,
      );

  // Convert Entity to API Object
  CourseApiModel toHiveModel(CourseEntity entity) => CourseApiModel(
        courseId: entity.courseId,
        courseName: entity.courseName,
      );

  // Convert API List to Entity List
  List<CourseEntity> toEntityList(List<CourseApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  //To JSON

  Map<String, dynamic> toJson() => _$CourseApiModelToJson(this);

  //From JSON

  factory CourseApiModel.fromJson(Map<String, dynamic> json) =>
      _$CourseApiModelFromJson(json);

  @override
  String toString() {
    return 'courseId: $courseId, courseName: $courseName';
  }
}
