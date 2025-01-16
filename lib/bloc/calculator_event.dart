part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class AddNumber extends CalculatorEvent {
  final String number;
  AddNumber(this.number);
}

class ClearInput extends CalculatorEvent {}

class PerformOperation extends CalculatorEvent {
  final String operation;
  PerformOperation(this.operation);
}
