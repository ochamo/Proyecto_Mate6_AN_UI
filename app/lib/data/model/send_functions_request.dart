import 'package:json_annotation/json_annotation.dart';
import 'package:proyecto_mate_6/data/model/function_request.dart';

part 'send_functions_request.g.dart';

@JsonSerializable()
class SendFunctionsRequests {
  @JsonKey(name: "functions")
  final List<FunctionRequest> functions;

  SendFunctionsRequests({required this.functions});

  factory SendFunctionsRequests.fromJson(Map<String, dynamic> json) =>
      _$SendFunctionsRequestsFromJson(json);

  Map<String, dynamic> toJson() => _$SendFunctionsRequestsToJson(this);
}
