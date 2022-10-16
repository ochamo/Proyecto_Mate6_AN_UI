import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_mate_6/core/di/injector.dart';
import 'package:proyecto_mate_6/core/navigation/app_router.dart';
import 'package:proyecto_mate_6/ui/cubit/input_function_cubit.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.landscapeLeft],
  );
  await initializeInjectedDependencies();
  // force windows full size for surface go 3 resolution
  await WindowManager.instance.ensureInitialized();
  // the package doesn't work with await
  // ignore: prefer-async-await
  WindowManager.instance.waitUntilReadyToShow().then((_) async {
    await WindowManager.instance.setTitleBarStyle(TitleBarStyle.normal);
    await WindowManager.instance.setResizable(false);
    await WindowManager.instance.maximize();
    await WindowManager.instance.show();
    await WindowManager.instance.setSkipTaskbar(false);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  MyApp({
    Key? key,
    AppRouter? appRouter,
  })  : appRouter = appRouter ?? getIt<AppRouter>(),
        super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        appRouter,
      ),
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: PointerDeviceKind.values.toSet(),
      ),
      builder: (context, child) {
        final MediaQueryData mediaQueryData = MediaQuery.of(context);
        return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<InputFunctionCubit>())
            ],
            child: MediaQuery(
              data: mediaQueryData.copyWith(
                textScaleFactor: 1.0,
              ),
              child: child ?? const SizedBox.shrink(),
            ));
      },
      theme: ThemeData(
          textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 96,
          fontWeight: FontWeight.w600,
          letterSpacing: -1.5,
          color: Colors.black,
        ),
        headline2: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
          color: Colors.black,
        ),
        headline3: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: Colors.black,
        ),
        headline4: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.25,
          color: Colors.black,
        ),
        headline5: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: Colors.black,
        ),
        headline6: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          color: Colors.black,
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: Colors.black,
        ),
        subtitle2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Colors.black,
        ),
        button: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          color: Colors.black,
        ),
        caption: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: Colors.black,
        ),
        overline: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: Colors.black,
        ),
      )),
    );
  }
}
