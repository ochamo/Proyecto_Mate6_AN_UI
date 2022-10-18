import 'package:proyecto_mate_6/core/di/injector.dart';
import 'package:proyecto_mate_6/data/model/function_result_model.dart';
import 'package:proyecto_mate_6/data/model/obj_mapper.dart';
import 'package:proyecto_mate_6/data/model/send_functions_request.dart';
import 'package:proyecto_mate_6/data/network/api_caller.dart';
import 'package:proyecto_mate_6/domain/dto/function_model.dart';
import 'package:proyecto_mate_6/domain/usecase/result.dart';

Future<Result<FunctionResultModel>> doCalcUseCase(
    List<FunctionModel> models) async {
  final mapper = getIt.get<ObjMapper>();
  var functions =
      models.map((e) => mapper.toFunctionRequestFromDto(e)).toList();
  var request = SendFunctionsRequests(functions: functions);

  try {
    final response = await doCalc(request);
    return Result.success(response!);
  } catch (e) {
    return Result.failed(e);
  }
}
