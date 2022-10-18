import 'package:proyecto_mate_6/data/model/function_request.dart';
import 'package:proyecto_mate_6/data/model/send_functions_request.dart';
import 'package:proyecto_mate_6/domain/dto/function_model.dart';

class ObjMapper {
  FunctionRequest toFunctionRequestFromDto(FunctionModel f) {
    return FunctionRequest(
        ft: f.ft, start: f.start.toString(), end: f.end.toString());
  }

  SendFunctionsRequests toSendFunctionRequestFromList(
      List<FunctionRequest> fs) {
    return SendFunctionsRequests(functions: fs);
  }
}
