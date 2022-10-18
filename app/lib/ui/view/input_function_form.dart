import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_mate_6/domain/dto/function_model.dart';
import 'package:proyecto_mate_6/ui/cubit/input_function_cubit.dart';

class InputFunctionForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputFunctionFormState();
}

class _InputFunctionFormState extends State<InputFunctionForm> {
  late TextEditingController _function;
  late TextEditingController _start;
  late TextEditingController _finish;

  @override
  void initState() {
    _function = TextEditingController();
    _start = TextEditingController();
    _finish = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Ingrese la función y su intervalo"),
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            Flexible(
              child: TextField(
                controller: _function,
                decoration: InputDecoration(hintText: "f(t)"),
              ),
            ),
            Flexible(
              child: TextField(
                controller: _start,
                decoration: InputDecoration(hintText: "Inicio"),
              ),
            ),
            Flexible(
              child: TextField(
                controller: _finish,
                decoration: InputDecoration(hintText: "Fin"),
              ),
            )
          ],
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: const Text("Cancelar")),
        ElevatedButton(
            onPressed: () {
              context.read<InputFunctionCubit>().add(FunctionModel(
                  ft: _function.text,
                  start: int.parse(_start.text),
                  end: int.parse(_finish.text)));
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(primary: Colors.green),
            child: const Text("Ok"))
      ],
    );
  }
}
