import 'dart:async';

mixin Validator {
  final inputValidation = StreamTransformer<String, double>.fromHandlers(
    handleData: (input, sink) {
      final intInput = double.tryParse(input);
      if (intInput != null) {
        sink.add(double.parse(input));
      } else {
        sink.add(0);
      }
    },
  );
  final resultConvertion = StreamTransformer<String, String>.fromHandlers(
    handleData: (input, sink) {
      print('hello $input');
      final res = double.parse(input);
      dynamic resultValue = res % 1 == 0 ? res.toInt() : res;
      sink.add('$resultValue');
    },
  );
}
