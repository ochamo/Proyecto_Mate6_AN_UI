import 'package:json_annotation/json_annotation.dart';

part 'function_result_model.g.dart';

@JsonSerializable()
class FunctionResultModel {
  @JsonKey(name: "a_n")
  final String an;
  @JsonKey(name: "b_n")
  final String bn;
  @JsonKey(name: "a_0")
  final String a0;
  final String period;
  @JsonKey(name: "value_n")
  final String valueOfN;
  final String plot;
  final String equation;

  const FunctionResultModel(
      {required this.an,
      required this.bn,
      required this.a0,
      required this.period,
      required this.valueOfN,
      required this.plot,
      required this.equation});

  factory FunctionResultModel.fromJson(Map<String, dynamic> json) =>
      _$FunctionResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionResultModelToJson(this);
}
