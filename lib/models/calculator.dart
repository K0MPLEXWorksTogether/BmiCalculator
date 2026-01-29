import 'dart:math';

class Calculator {
  final int height;
  final int weight;
  Calculator({required this.height, required this.weight});

  double _bmi = 0.0;
  String calculateBMI() {
    double heightInMeters = height / 100.0;
    _bmi = weight / pow(heightInMeters, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if(_bmi >= 25) {
      return 'Overweight';
    } else if(_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if(_bmi >= 25) {
      return 'You have a higher than normal body weight. Exercise more!';
    } else if(_bmi >= 18.5) {
      return 'You have a normal body weight. Score!';
    } else {
      return 'You have a lower than normal body weight. Eat more!';
    }
  }
}