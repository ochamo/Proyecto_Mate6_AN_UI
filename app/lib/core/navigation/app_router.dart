import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_mate_6/core/navigation/routes.dart';
import 'package:proyecto_mate_6/data/model/function_result_model.dart';
import 'package:proyecto_mate_6/ui/input_function_screen.dart';
import 'package:proyecto_mate_6/ui/results_screen.dart';
import 'package:proyecto_mate_6/ui/splash_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  AutoRoute(path: Routes.root, page: SplashScreen, initial: true),
  AutoRoute(path: Routes.inputScreen, page: InputFunctionScreen),
  AutoRoute(path: Routes.resultsScreen, page: ResultsScreen)
])
class AppRouter extends _$AppRouter {}
