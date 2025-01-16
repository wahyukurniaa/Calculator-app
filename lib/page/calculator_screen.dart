import 'package:bloc_calcultor_app/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CalculatorBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<CalculatorBloc, CalculatorState>(
                  builder: (context, state) => Text(
                    state.display,
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
              ),
            ),
            ..._buildKeyPad(bloc),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildKeyPad(CalculatorBloc bloc) {
    final keys = [
      ['7', '8', '9', '/'],
      ['4', '5', '6', '*'],
      ['1', '2', '3', '-'],
      ['C', '0', '=', '+'],
    ];

    return keys.map((row) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: row.map((key) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if (key == 'C') {
                  bloc.add(ClearInput());
                } else if (key == '+' ||
                    key == '-' ||
                    key == '*' ||
                    key == '/' ||
                    key == '=') {
                  bloc.add(PerformOperation(key));
                } else {
                  bloc.add(AddNumber(key));
                }
              },
              style: ElevatedButton.styleFrom(fixedSize: const Size(72, 72)),
              child: Text(
                key,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          );
        }).toList(),
      );
    }).toList();
  }
}
