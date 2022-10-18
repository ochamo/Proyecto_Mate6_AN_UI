import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:proyecto_mate_6/core/navigation/app_router.dart';
import 'package:proyecto_mate_6/data/model/obj_mapper.dart';
import 'package:proyecto_mate_6/ui/cubit/input_function_cubit.dart';

final getIt = GetIt.instance;

Future<void> initializeInjectedDependencies() async {
  getIt.registerSingleton(AppRouter());
  getIt.registerSingleton(InputFunctionCubit());
  final options = BaseOptions(baseUrl: 'http://localhost:5000/');
  getIt.registerSingleton(Dio(options));
  getIt.registerSingleton(ObjMapper());
}
