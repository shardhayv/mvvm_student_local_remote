import 'package:json_annotation/json_annotation.dart';

import '../../model/batch_api_model.dart';

part 'get_all_batch_dto.g.dart';

@JsonSerializable()
class GetAllBatchDto {
  final bool success;
  final int count;
  // @JsonKey(name: 'data')
  final List<BatchApiModel> data;

  GetAllBatchDto({
    required this.success,
    required this.count,
    required this.data,
  });

  factory GetAllBatchDto.fromJson(Map<String, dynamic> json) =>
      _$GetAllBatchDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllBatchDtoToJson(this);
}
