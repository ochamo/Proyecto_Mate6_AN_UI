import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:proyecto_mate_6/core/assets.dart';
import 'package:proyecto_mate_6/core/navigation/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer1;
  late Timer timer2;
  final int _splashTimeInSeconds = 10;
  double seconds = 0.0;

  @override
  void initState() {
    super.initState();
    timer1 = Timer.periodic(Duration(seconds: _splashTimeInSeconds), (_) async {
      _goToInput();
    });
    startTimer();
  }

  void startTimer() {
    timer2 = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (seconds < _splashTimeInSeconds) {
        setState(() {
          seconds += 0.01;
        });
      } else {
        timer1.cancel();
        timer2.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 3,
                  child: Lottie.asset(Assets.teacherAnim,
                      frameRate: FrameRate.max)),
              Expanded(
                flex: 1,
                child: AutoSizeText(
                  "Proyecto Matemática 6",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    AutoSizeText(
                      "Integrantes:",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const Spacer(),
                    AutoSizeText(
                      "Otto Chamo",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    AutoSizeText(
                      "Anibal Rivera",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: seconds,
                        color: Colors.black,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                      IconButton(
                        onPressed: () => _goToInput(),
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  @override
  void dispose() {
    timer1.cancel();
    timer2.cancel();
    super.dispose();
  }

  void _goToInput() {
    AutoRouter.of(context).replaceNamed(Routes.inputScreen);
  }
}
