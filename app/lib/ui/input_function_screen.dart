import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_mate_6/core/navigation/app_router.dart';
import 'package:proyecto_mate_6/ui/cubit/input_function_cubit.dart';
import 'package:proyecto_mate_6/ui/view/function_item.dart';
import 'package:proyecto_mate_6/ui/view/input_function_form.dart';

class InputFunctionScreen extends StatefulWidget {
  const InputFunctionScreen({Key? key}) : super(key: key);

  @override
  State<InputFunctionScreen> createState() => _InputFunctionScreenState();
}

class _InputFunctionScreenState extends State<InputFunctionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText(
          'Serie de Fourier Truncada',
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 1,
              child: AutoSizeText(
                "Presione ingresar para colocar lo que devuelve f(t) según cierto intervalo",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green, onPrimary: Colors.white),
                      onPressed: () {
                        _openDialog(context);
                      },
                      child: const Text(
                        "Ingresar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    BlocBuilder<InputFunctionCubit, InputFunctionState>(
                      builder: (context, state) {
                        return state.when(loaded: (items) {
                          if (items.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blueAccent,
                                    onPrimary: Colors.white),
                                onPressed: () {
                                  _openResults(context);
                                },
                                child: const Text(
                                  "Ver resultados",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: BlocBuilder<InputFunctionCubit, InputFunctionState>(
                builder: (context, state) {
                  return state.when(loaded: (items) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: ((context, index) {
                          var item = items[index];
                          return FunctionItem(f: item, index: index);
                        }),
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (ctx) {
        return InputFunctionForm();
      },
    );
  }

  Future<void> _openResults(BuildContext context) async {
    var response = await context.read<InputFunctionCubit>().sendData();
    response.when(success: (result) {
      context.router.push(ResultsRoute(r: result));
    }, failed: (_) {
      final snackBar = SnackBar(
          content: Text(
            'No se ha podido realizar la operacion',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          backgroundColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
