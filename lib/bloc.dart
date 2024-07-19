import 'dart:async';

import 'package:practice/validator.dart';

class Bloc extends Object with Validator {
  final _firstInput = StreamController<String>.broadcast();
  final _secondInput = StreamController<String>.broadcast();
  final _result = StreamController<String>.broadcast();

  double _latestFirstInput = 0;
  double _latestSecondInput = 0;

  Stream<double> get firstInput =>
      _firstInput.stream.transform(inputValidation);
  Stream<double> get secondInput =>
      _secondInput.stream.transform(inputValidation);
  Stream<String> get result => _result.stream.transform(resultConvertion);

  Function(String) get updateFirstInput => _firstInput.sink.add;
  Function(String) get updateSecondInput => _secondInput.sink.add;
  Function(String) get updateResult => _result.sink.add;

  Bloc() {
    firstInput.listen((data) {
      _latestFirstInput = data;
    });
    secondInput.listen((data) {
      _latestSecondInput = data;
    });
  }

  double get latestFirstInput => _latestFirstInput;
  double get latestSecondInput => _latestSecondInput;
}

final bloc = Bloc();
