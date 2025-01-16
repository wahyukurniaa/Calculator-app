import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  String _input = '';
  double? _firstOperand;
  String? _operator;

  CalculatorBloc() : super(const CalculatorState(display: '0')) {
    on<AddNumber>((event, emit) {
      _input += event.number;
      emit(CalculatorState(display: _input));
    });

    on<ClearInput>((event, emit) {
      _input = '';
      _firstOperand = null;
      _operator = null;
      emit(const CalculatorState(display: '0'));
    });

    on<PerformOperation>((event, emit) {
      if (_operator == null) {
        _firstOperand = double.tryParse(_input);
        _operator = event.operation;
        _input = '';
      } else {
        final secondOperand = double.tryParse(_input);
        if (_firstOperand != null && secondOperand != null) {
          switch (_operator) {
            case '+':
              _firstOperand = _firstOperand! + secondOperand;
              break;
            case '-':
              _firstOperand = _firstOperand! - secondOperand;
              break;
            case '*':
              _firstOperand = _firstOperand! * secondOperand;
              break;
            case '/':
              _firstOperand = secondOperand != 0
                  ? _firstOperand! / secondOperand
                  : double.nan;
              break;
          }
        }
        _input = _firstOperand?.toString() ?? '0';
        _operator = event.operation == '=' ? null : event.operation;
      }
      emit(CalculatorState(display: _input));
    });
  }
}
