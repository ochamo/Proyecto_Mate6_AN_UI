import 'package:get_it/get_it.dart';
import 'package:proyecto_mate_6/core/navigation/app_router.dart';
import 'package:proyecto_mate_6/ui/cubit/input_function_cubit.dart';

final getIt = GetIt.instance;

Future<void> initializeInjectedDependencies() async {
  getIt.registerSingleton(AppRouter());
  getIt.registerSingleton(InputFunctionCubit());
}
