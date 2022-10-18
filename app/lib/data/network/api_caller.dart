import 'package:dio/dio.dart';
import 'package:proyecto_mate_6/core/di/injector.dart';
import 'package:proyecto_mate_6/data/model/function_result_model.dart';
import 'package:proyecto_mate_6/data/model/send_functions_request.dart';

Future<FunctionResultModel?> doCalc(SendFunctionsRequests data) async {
  final dio = getIt.get<Dio>();
  try {
    var response = await dio.post('/fourier', data: data.toJson());
    var result = FunctionResultModel.fromJson(response.data);
    return result;
  } on Exception catch (ex) {
    throw Exception('No se pudo realizar la operacion');
  }
}
