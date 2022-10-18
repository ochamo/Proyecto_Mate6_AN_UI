import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_mate_6/domain/dto/function_model.dart';
import 'package:proyecto_mate_6/ui/cubit/input_function_cubit.dart';

class FunctionItem extends StatelessWidget {
  final FunctionModel f;
  final int index;

  const FunctionItem({Key? key, required this.f, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: RichText(
            text: TextSpan(
                text: "f(t) = ",
                style: Theme.of(context).textTheme.headline5,
                children: <TextSpan>[
                  TextSpan(
                      text: f.ft, style: Theme.of(context).textTheme.bodyLarge)
                ]),
          ),
        ),
        Expanded(
          flex: 1,
          child: RichText(
            text: TextSpan(
                text: "Definido en: ",
                style: Theme.of(context).textTheme.headline5,
                children: <TextSpan>[
                  TextSpan(
                      text: "[${f.start}, ${f.end}]",
                      style: Theme.of(context).textTheme.bodyText1)
                ]),
          ),
        ),
        Flexible(
          flex: 2,
          child: IconButton(
            icon: const Icon(Icons.delete_forever),
            color: Colors.red,
            onPressed: () {
              context.read<InputFunctionCubit>().delete(index);
            },
          ),
        )
      ],
    );
  }
}
