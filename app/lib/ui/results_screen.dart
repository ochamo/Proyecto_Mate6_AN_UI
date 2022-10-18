import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:proyecto_mate_6/data/model/function_result_model.dart';

class ResultsScreen extends StatelessWidget {
  FunctionResultModel r;
  ResultsScreen({required this.r});

  final double separatorSize = 50;

  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Resultados Serie de fourier truncada",
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: separatorSize),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Período de la función ingresada: ",
                              style: Theme.of(context).textTheme.headline5,
                              children: <TextSpan>[
                                TextSpan(
                                    text: r.period,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                            fontWeight: FontWeight.normal))
                              ]),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Coeficiente a_0: ",
                              style: Theme.of(context).textTheme.headline5,
                              children: <TextSpan>[
                                TextSpan(
                                    text: r.a0,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                            fontWeight: FontWeight.normal))
                              ]),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Coeficiente a_n: ",
                              style: Theme.of(context).textTheme.headline5,
                              children: <TextSpan>[
                                TextSpan(
                                    text: r.an,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                            fontWeight: FontWeight.normal))
                              ]),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Coeficiente b_n ",
                              style: Theme.of(context).textTheme.headline5,
                              children: <TextSpan>[
                                TextSpan(
                                    text: r.bn,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                            fontWeight: FontWeight.normal))
                              ]),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "Valor de N: ",
                              style: Theme.of(context).textTheme.headline5,
                              children: <TextSpan>[
                                TextSpan(
                                    text: r.valueOfN,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                            fontWeight: FontWeight.normal))
                              ]),
                        )
                      ],
                    ),
                    Text("Ecuación de la serie de Fourier trigonométrica",
                        style: Theme.of(context).textTheme.headline5),
                    base64Image(r.equation),
                    Text(
                        "Gráfica aproximada de la serie de Fourier trigonométrica truncada a 2N + 1 términos",
                        style: Theme.of(context).textTheme.headline5),
                    base64Image(r.plot)
                  ]),
            ),
          ),
        ),
      );
    }
  }

  Widget base64Image(String img) {
    Uint8List bytes = const Base64Decoder().convert(img);
    return Image.memory(
      bytes,
      width: 550,
    );
  }
}
