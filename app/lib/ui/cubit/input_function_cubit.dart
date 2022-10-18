import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proyecto_mate_6/data/model/function_result_model.dart';
import 'package:proyecto_mate_6/domain/dto/function_model.dart';
import 'package:proyecto_mate_6/domain/usecase/calc_use_case.dart';
import 'package:proyecto_mate_6/domain/usecase/result.dart';

part 'input_function_cubit.freezed.dart';

class InputFunctionCubit extends Cubit<InputFunctionState> {
  InputFunctionCubit() : super(const InputFunctionState.loaded([]));

  void add(FunctionModel f) {
    var items = (state as _Loaded).functions;
    List<FunctionModel> newList = List.from(items)..add(f);
    emit((state as _Loaded).copyWith(functions: newList));
  }

  void delete(int i) {
    var items = (state as _Loaded).functions;
    List<FunctionModel> newList = List.from(items)..removeAt(i);
    emit((state as _Loaded).copyWith(functions: newList));
  }

  Future<Result<FunctionResultModel>> sendData() async {
    var items = (state as _Loaded).functions;
    var response = await doCalcUseCase(items);
    return response;
  }
}

@freezed
abstract class InputFunctionState with _$InputFunctionState {
  const factory InputFunctionState.loaded(List<FunctionModel> functions) =
      _Loaded;
}
