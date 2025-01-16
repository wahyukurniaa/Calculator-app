import 'package:bloc_calcultor_app/bloc/calculator_bloc.dart';
import 'package:bloc_calcultor_app/page/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CalculatorBloc(),
        child: const CalculatorScreen(),
      ),
    );
  }
}
