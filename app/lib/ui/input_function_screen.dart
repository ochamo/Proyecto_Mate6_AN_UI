import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                child: ElevatedButton(
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
}
