import 'package:json_annotation/json_annotation.dart';

part 'function_request.g.dart';

@JsonSerializable()
class FunctionRequest {
  @JsonKey(name: "f_t")
  final String ft;

  final String start;
  final String end;

  FunctionRequest({required this.ft, required this.start, required this.end});

  factory FunctionRequest.fromJson(Map<String, dynamic> json) =>
      _$FunctionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionRequestToJson(this);
}
